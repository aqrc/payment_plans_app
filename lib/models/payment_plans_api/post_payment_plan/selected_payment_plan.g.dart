// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_payment_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedPaymentPlan _$SelectedPaymentPlanFromJson(Map<String, dynamic> json) =>
    SelectedPaymentPlan(
      id: json['id'] as String,
      dates: (json['dates'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$SelectedPaymentPlanToJson(
        SelectedPaymentPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dates': instance.dates.map((e) => e.toIso8601String()).toList(),
    };
