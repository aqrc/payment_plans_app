import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../models/payment_plans_api/get_payment_plans/payment.dart';
import '../../../models/payment_plans_api/get_payment_plans/payment_plan.dart';

class PaymentPlanSelectionCardViewModel extends IndexTrackingViewModel {
  final pageController = PageController();
  static final _dateFormat = DateFormat("MM/dd");
  static const _oneDay = Duration(days: 1);

  final List<PaymentPlan> paymentPlans;
  final void Function(String, List<DateTime>) setSelectedPlanCallback;
  final Map<String, Map<int, DateTime>> _editedPayments = {};

  PaymentPlanSelectionCardViewModel({
    required this.paymentPlans,
    required this.setSelectedPlanCallback,
  });

  String getButtonTitle(int index) {
    return paymentPlans[index].payments.length.toString();
  }

  void setPage(int index) {
    pageController.jumpToPage(index);
    _setSelectedPaymentPlan(paymentPlans[index].id);
    setIndex(index);
  }

  List<EditablePayment> getEditablePayments(String planId) {
    final payments =
        paymentPlans.firstWhere((plan) => plan.id == planId).payments;

    return payments.mapIndexed(
      (index, payment) {
        final initialDate = _editedPayments[planId]?[index] ?? payment.date;
        return EditablePayment(
          amount: payment.amountAsString,
          initialDate: initialDate,
          initialDateFormatted: _dateFormat.format(initialDate),
          firstDate: index == 0
              ? payments.first.date
              : _getPaymentDateAtIndex(planId, index - 1, payments)
                  .add(_oneDay),
          lastDate: index == payments.length - 1
              ? payments.last.date
              : _getPaymentDateAtIndex(planId, index + 1, payments)
                  .subtract(_oneDay),
          onEdited: (dateTime) {
            _editedPayments[planId] ??= {};
            _editedPayments[planId]![index] = dateTime;
            _setSelectedPaymentPlan(planId);
            rebuildUi();
          },
        );
      },
    ).toList();
  }

  void _setSelectedPaymentPlan(String planId) {
    final payments =
        paymentPlans.firstWhere((plan) => plan.id == planId).payments;

    setSelectedPlanCallback(
      planId,
      payments
          .mapIndexed(
            (index, payment) => _getPaymentDateAtIndex(planId, index, payments),
          )
          .toList(),
    );
  }

  DateTime _getPaymentDateAtIndex(
    String planId,
    int paymentIndex,
    List<Payment> payments,
  ) {
    return _editedPayments[planId]?[paymentIndex] ??
        payments[paymentIndex].date;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class EditablePayment {
  final String amount;
  final DateTime initialDate;
  final String initialDateFormatted;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime) onEdited;

  EditablePayment({
    required this.amount,
    required this.initialDate,
    required this.initialDateFormatted,
    required this.firstDate,
    required this.lastDate,
    required this.onEdited,
  });
}
