// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPlan _$PaymentPlanFromJson(Map<String, dynamic> json) => PaymentPlan(
      json['id'] as String,
      (json['payments'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
