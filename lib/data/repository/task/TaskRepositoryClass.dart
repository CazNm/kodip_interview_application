

import 'package:sampl/data/dto/networkDTO/response/BaseResponseDTO.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';

import '../../dto/localDTO/ExampleDTO.dart';
import '../../dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';

abstract class TaskRepositoryClass {

  Future<void> postLogin(
      Future<void> Function(BaseResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<void> postHome(
      Future<void> Function(HomeResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<void> postTransactions(
      int page,
      Future<void> Function(TransactionsResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  );

  Future<CurrencyResponseDTO> postCurrency(
      CurrencySymbol symbol,
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  );


  Future<void> postTransaction(
      int tr_id,
      Future<void> Function(TransactionSummaryNetworkDTO) onSuccess,
      Future<void> Function(String) onFail
  );
}