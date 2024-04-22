
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
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/login",
        {"hashed" : hashedParam},
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postHome(
      String hashedParam,
      Map<String, String>? body,
      {
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/home",
        {"hashed" : hashedParam},
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postCurrency(
      String hashedParam,
      Map<String, String> body,
      {
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/currency",
        {"hashed" : hashedParam},
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postTransactions(
      String hashedParam,
      int page,
      Map<String, dynamic>? body,
      {
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    await _httpClient.post(
        "/task/transactions",
        {
          "hashed" : hashedParam,
          "page" : page.toString()
        },
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }

  Future<void> postTransaction(
      String hashedParam,
      int tr_id,
      Map<String, String>? body,
      {
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  )  async {
    await _httpClient.post(
        "/task/transaction",
        {
          "hashed" : hashedParam,
          "tr_id" : tr_id.toString()
        },
        body,
        onSuccess: onSuccess,
        onFail: onFail
    );
  }
}