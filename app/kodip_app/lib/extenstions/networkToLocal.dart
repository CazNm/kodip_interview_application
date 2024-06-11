
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/enum/PaymentType.dart';
import 'package:sampl/data/dto/localDTO/TransactionSummary.dart';
import 'package:sampl/data/dto/localDTO/User.dart';
import 'package:sampl/data/dto/localDTO/Wallet.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/UserNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/WalletNetworkDTO.dart';
import '../data/dto/localDTO/ExampleDTO.dart';
import '../data/dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';

extension ExampleDTOtoLocal on ExampleNetworkDTO {
  ExampleDTO toLocalDTO() {
    return ExampleDTO(id: id, example: example);
  }
}

extension UserDTOtoLocal on UserNetworkDTO {
  User toLocalDTO() {
    return User(
        name: name,
        deposit_amount: deposit_amount
    );
  }
}

extension WalletDTOtoLocal on WalletNetworkDTO {
  Wallet toLocalDTO() {
    return Wallet(
        currency: currency,
        symbol: symbol,
        emoji: emoji,
        amount: amount
    );
  }
}



extension TransactionSummaryDTOtoLocal on TransactionSummaryNetworkDTO {
  TransactionSummary toLocalDTO() {
    CurrencySymbol localTrCurrency;
    PaymentType localPaymentType;


    if(CurrencySymbol.CNY.name == tr_currency) {
      localTrCurrency = CurrencySymbol.CNY;
    } else if (CurrencySymbol.JPY.name == tr_currency) {
      localTrCurrency = CurrencySymbol.JPY;
    } else if (CurrencySymbol.KRW.name == tr_currency) {
      localTrCurrency = CurrencySymbol.KRW;
    } else if (CurrencySymbol.MXN.name == tr_currency) {
      localTrCurrency = CurrencySymbol.MXN;
    } else if (CurrencySymbol.USD.name == tr_currency) {
      localTrCurrency = CurrencySymbol.USD;
    } else {
      throw Error();
    }

    if(PaymentType.once.name == tr_type) {
      localPaymentType = PaymentType.once;
    } else if( PaymentType.installments.name == tr_type) {
      localPaymentType = PaymentType.installments;
    } else {
      throw Error();
    }


    return TransactionSummary(
        tr_id: tr_id,
        tr_title: tr_title,
        tr_amount: tr_amount,
        tr_currency: localTrCurrency,
        tr_type: localPaymentType,
        tr_dt: tr_dt
    );
  }
}