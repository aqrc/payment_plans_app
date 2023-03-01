import 'package:flutter/material.dart';

import 'app.dart';
import 'services/payment_plans_api_client.dart';
import 'stacked/stacked_app.locator.dart';

void main() async {
  await setupLocator();
  await locator<PaymentPlansApiClient>().getPaymentPlans();

  runApp(const App());
}