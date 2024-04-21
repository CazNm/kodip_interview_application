import 'dart:convert';

import 'package:sampl/util/debugPrint.dart';

class WalletNetworkDTO {

  final String currency;
  final String symbol;
  final String emoji;
  final int amount;

  WalletNetworkDTO({
    required this.currency,
    required this.symbol,
    required this.emoji,
    required this.amount
  });

  factory WalletNetworkDTO.fromJson(Map<String, dynamic> json) {
    var amount = json["amount"];

    if(amount.runtimeType == double) {
      amount = (amount as double).round();
    }

    return WalletNetworkDTO(
        currency: json["currency"],
        symbol: json["symbol"],
        emoji: json["emoji"],
        amount: amount
    );
  }
}

