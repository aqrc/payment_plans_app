import 'package:dio/dio.dart';

import '../models/payment_plans_api/get_payment_plans/get_payment_plans_response.dart';
import '../models/payment_plans_api/post_payment_plan/selected_payment_plan.dart';
import '../stacked/stacked_app.locator.dart';

class PaymentPlansApiClient {
  late final _dio = locator<Dio>();

  static const _path =
      "https://a21wk56avh.execute-api.us-east-1.amazonaws.com/default/flutter-home-exam";

  Future<GetPaymentPlansResponse> getPaymentPlans() async {
    final response = await _dio.get(_path);

    final responseDeserialized =
        GetPaymentPlansResponse.fromJson(response.data);
    return responseDeserialized;
  }

  Future<void> postPaymentPlan(
    SelectedPaymentPlan paymentPlan,
  ) async {
    final response = await _dio.post(_path, data: paymentPlan.toJson());
  }
}
