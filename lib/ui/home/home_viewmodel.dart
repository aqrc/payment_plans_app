import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/payment_plans_api/get_payment_plans/get_payment_plans_response.dart';
import '../../models/payment_plans_api/get_payment_plans/payment_plan.dart';
import '../../models/payment_plans_api/post_payment_plan/selected_payment_plan.dart';
import '../../services/payment_plans_service.dart';
import '../../stacked/stacked_app.locator.dart';

class HomeViewModel extends FutureViewModel<GetPaymentPlansResponse> {
  late final _paymentPlansService = locator<PaymentPlansService>();

  SelectedPaymentPlan? selectedPaymentPlan;

  @override
  Future<GetPaymentPlansResponse> futureToRun() =>
      _paymentPlansService.paymentPlans;

  String get totalPaymentDollars => data!.amount
      .toString()
      .characters
      .take(data!.amount.toString().length - 2)
      .string;

  String get totalPaymentCents =>
      data!.amount.toString().characters.takeLast(2).string;

  List<PaymentPlan> get paymentPlans => data!.paymentPlans;

  void setSelectedPlan(String planId, List<DateTime> paymentDates) {
    selectedPaymentPlan = SelectedPaymentPlan(id: planId, dates: paymentDates);
  }

  Future<void> submitSelectedPlan() async {
    selectedPaymentPlan ??= SelectedPaymentPlan(
      id: paymentPlans.first.id,
      dates:
          paymentPlans.first.payments.map((payment) => payment.date).toList(),
    );

    await _paymentPlansService.postPaymentPlan(selectedPaymentPlan!);
  }
}
