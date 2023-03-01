import 'package:json_annotation/json_annotation.dart';

import 'payment.dart';

part 'payment_plan.g.dart';

@JsonSerializable(createToJson: false)
class PaymentPlan {
  final String id;
  final List<Payment> payments;

  PaymentPlan(this.id, this.payments);

  factory PaymentPlan.fromJson(Map<String, dynamic> json) =>
      _$PaymentPlanFromJson(json);
}
