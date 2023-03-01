// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_plans_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentPlansResponse _$GetPaymentPlansResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentPlansResponse(
      json['amount'] as int,
      (json['payment_plans'] as List<dynamic>)
          .map((e) => PaymentPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
