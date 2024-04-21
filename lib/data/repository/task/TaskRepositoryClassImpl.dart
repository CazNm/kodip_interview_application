
import 'package:sampl/data/dto/networkDTO/networkDTO/UserNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/WalletNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/BaseResponseDTO.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/datasource/ExampleDataSource.dart';
import 'package:sampl/data/datasource/TaskDatasource.dart';
import 'package:sampl/data/dto/localDTO/ExampleDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';
import 'package:sampl/extenstions/ListMapper.dart';
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
      Future<void> Function(BaseResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  ) async {
    String? hashedValue = await cbcPlugin.encodeStringWithCBC("/task/login");
    await taskDatasource.postTaskLogin(
        hashedValue ?? "",
        null,
        onSuccess: (Map<String, dynamic> responseJson) async {
          var responseJson2DTO = BaseResponseDTO.fromJson(responseJson);
          await onSuccess(responseJson2DTO);
        },
        onFail: onFail
    );
  }

  @override
  Future<void> postHome(
      Future<void> Function(HomeResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  ) async {
    String? hashedValue = await cbcPlugin.encodeStringWithCBC("/task/home");
    await taskDatasource.postHome(
        hashedValue ?? "",
        null,
        onSuccess: (Map<String, dynamic> responseJson) async {
          var userJson2DTO = UserNetworkDTO.fromJson(responseJson["user"]);

          List<dynamic> walletJsonList = responseJson["wallets"];
          List<WalletNetworkDTO> walletDTOList = walletJsonList.onMap((item) => WalletNetworkDTO.fromJson(item));

          for(var walletJson in walletJsonList) {
            walletDTOList.add(WalletNetworkDTO.fromJson(walletJson));
          }
          await onSuccess(HomeResponseDTO(user: userJson2DTO, wallets: walletDTOList));
        },
        onFail: onFail
    );
  }

  @override
  Future<void> postTransactions(
      int page,
      Future<void> Function(TransactionsResponseDTO) onSuccess,
      Future<void> Function(String) onFail
  ) async {
    String? hashedValue = await cbcPlugin.encodeStringWithCBC("/task/transactions");
    await taskDatasource.postTransactions(
        hashedValue ?? "",
        {
          "page" : page.toString()
        },
        onSuccess: (Map<String, dynamic> responseJson) async {
          List<dynamic> transactionList = responseJson["transactions"];

          var transactionResponseDTO = TransactionsResponseDTO(
              transactions: transactionList.onMap((item) => TransactionSummaryNetworkDTO.fromJson(item)),
              next: responseJson["next"]
          );
          await onSuccess(transactionResponseDTO);
        },
        onFail: onFail
    );

  }

  @override
  Future<CurrencyResponseDTO> postCurrency(CurrencySymbol symbol, void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postCurrency
    throw UnimplementedError();
  }

  @override
  Future<TransactionSummaryNetworkDTO> postTransaction(int tr_id, void Function(dynamic p1) onSuccess, void Function(String p1) onFail) {
    // TODO: implement postTransaction
    throw UnimplementedError();
  }
}