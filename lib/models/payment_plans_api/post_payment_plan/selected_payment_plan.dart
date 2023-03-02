import 'package:json_annotation/json_annotation.dart';

part 'selected_payment_plan.g.dart';

@JsonSerializable()
class SelectedPaymentPlan {
  final String id;
  final List<DateTime> dates;

  SelectedPaymentPlan({
    required this.id,
    required this.dates,
  });

  Map<String, dynamic> toJson() => _$SelectedPaymentPlanToJson(this);
}
