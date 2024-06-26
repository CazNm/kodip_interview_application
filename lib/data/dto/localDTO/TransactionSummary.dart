import 'package:flutter/cupertino.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/enum/PaymentType.dart';

class TransactionSummary {
  final int tr_id;
  final String tr_title;
  final int tr_amount;
  final CurrencySymbol tr_currency;
  final PaymentType tr_type;
  final String tr_dt;

  TransactionSummary(
  {
    required this.tr_id,
    required this.tr_title,
    required this.tr_amount,
    required this.tr_currency,
    required this.tr_type,
    required this.tr_dt
  });
}