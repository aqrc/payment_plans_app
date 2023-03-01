import 'package:json_annotation/json_annotation.dart';

import 'payment_plan.dart';

part 'get_payment_plans_response.g.dart';

@JsonSerializable(createToJson: false)
class GetPaymentPlansResponse {
  final int amount;
  @JsonKey(name: "payment_plans")
  final List<PaymentPlan> paymentPlans;

  GetPaymentPlansResponse(this.amount, this.paymentPlans);

  factory GetPaymentPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentPlansResponseFromJson(json);
}
