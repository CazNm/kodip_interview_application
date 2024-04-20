
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/datasource/ExampleDataSource.dart';
import 'package:sampl/data/datasource/TaskDatasource.dart';
import 'package:sampl/data/dto/localDTO/ExampleDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';
import 'package:sampl/extenstions/networkToLocal.dart';
import 'package:cbcplugin/cbcplugin.dart';
import 'package:sampl/util/debugPrint.dart';

import 'TaskRepositoryClass.dart';

class TaskRepositoryClassImpl extends TaskRepositoryClass {

  TaskRepositoryClassImpl._privateConstructor();
  static final TaskRepositoryClassImpl _instance = TaskRepositoryClassImpl._privateConstructor();

  var taskDatasource = TaskDatasource();
  var cbcPlugin = Cbcplugin();


  factory TaskRepositoryClassImpl() {
    return _instance;
  }

  @override
  Future<void> postLogin(
      Future<void> Function(dynamic) onSuccess,
      Future<void> Function(String) onFail
  ) async {
    // TODO: implement postLogin
    String? hashedValue = await cbcPlugin.encodeStringWithCBC("/task/login");
    printHelper("hased value is $hashedValue");
   await taskDatasource.postTaskLogin(
        hashedValue ?? "",
        null,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  @override
  Future<CurrencyResponseDTO> postCurrency(CurrencySymbol symbol, void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postCurrency
    throw UnimplementedError();
  }

  @override
  Future<HomeResponseDTO> postHome(void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postHome
    throw UnimplementedError();
  }

  @override
  Future<TransactionSummaryNetworkDTO> postTransaction(int tr_id, void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postTransaction
    throw UnimplementedError();
  }

  @override
  Future<TransactionsResponseDTO> postTransactions(int page, void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postTransactions
    throw UnimplementedError();
  }
  

  
}