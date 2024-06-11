import 'package:intl/intl.dart';

extension IntExtension on int {

  String toCurrencyFormat() {
    final currencyFormat =  NumberFormat("#,###", "en_US");
    return currencyFormat.format(this);
  }

}