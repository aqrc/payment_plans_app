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