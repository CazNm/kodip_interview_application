

import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';

import '../../dto/localDTO/ExampleDTO.dart';
import '../../dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';

abstract class TaskRepositoryClass {

  Future<void> postLogin(
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<HomeResponseDTO> postHome(
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<CurrencyResponseDTO> postCurrency(
      CurrencySymbol symbol,
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<TransactionsResponseDTO> postTransactions(
      int page,
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<TransactionSummaryNetworkDTO> postTransaction(
      int tr_id,
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );
}