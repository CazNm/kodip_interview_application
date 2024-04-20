
import 'dart:io';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/BaseResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';

import '../dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';
import '../httpClient/HttpClientLocal.dart';

class TaskDatasource {
  final HttpClientLocal _httpClient = HttpClientLocal();

  Future<void> postTaskLogin(
      String hashedParam,
      Map<String, String>? body,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/login",
        hashedParam,
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postHome(
      String hashedParam,
      Map<String, String> body,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/home",
        hashedParam,
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postCurrency(
      String hashedParam,
      Map<String, String> body,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/currency",
        hashedParam,
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postTransactions(
      String hashedParam,
      Map<String, String> body,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/transactions",
        hashedParam,
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postTransaction(
      String hashedParam,
      Map<String, String> body,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  )  async {
    await _httpClient.post(
        "/task/transaction",
        hashedParam,
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }
}