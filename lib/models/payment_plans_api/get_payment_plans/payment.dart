import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable(createToJson: false)
class Payment {
  final DateTime date;
  final int amount;

  Payment(this.date, this.amount);

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

extension AmountAsString on Payment {
  String get amountAsString => amount % 100 == 0
      ? (amount ~/ 100).toString()
      : "${amount ~/ 100}.${amount.toString().characters.takeLast(2)}";
}
