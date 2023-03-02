import 'dart:async';

import '../models/payment_plans_api/get_payment_plans/get_payment_plans_response.dart';
import '../models/payment_plans_api/post_payment_plan/selected_payment_plan.dart';
import '../stacked/stacked_app.locator.dart';
import 'payment_plans_api_client.dart';

class PaymentPlansService {
  late final _paymentPlansApiClient = locator<PaymentPlansApiClient>();

  final _paymentPlansCompleter = Completer<GetPaymentPlansResponse>();

  Future<GetPaymentPlansResponse> get paymentPlans =>
      _paymentPlansCompleter.future;

  Future<void> init() async {
    _paymentPlansCompleter.complete(_paymentPlansApiClient.getPaymentPlans());
  }

  Future<void> postPaymentPlan(SelectedPaymentPlan paymentPlan) async {
    await _paymentPlansApiClient.postPaymentPlan(paymentPlan);
  }
}
