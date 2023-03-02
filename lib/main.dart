import 'package:flutter/material.dart';

import 'app.dart';
import 'services/payment_plans_service.dart';
import 'stacked/stacked_app.locator.dart';

void main() async {
  await setupLocator();
  await locator<PaymentPlansService>().init();

  runApp(const App());
}