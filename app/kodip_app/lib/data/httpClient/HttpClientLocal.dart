import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sampl/util/debugPrint.dart';

class HttpClientLocal {

  final _client = http.Client();

  /// django 에서 ALLOW HOST 에 ip 를 허용해야 합니다.
  /// 현재는 emulator loacl host 만 테스트를 완료 하였습니다.
  ///
  /// 실물 기기 연결의 경우 아직 세팅 법을 찾지 못했습니다.
  ///
  /// ui 및 기능 개발 완료 후 실물기기 연결 가이드 제작 예정입니다.
  final String _baseUrl = "10.0.2.2:8000";
  // final String _baseUrl = "reqres.in";

   Future<T> get<T>(
      String methodUrl,
  ) async {
     http.Response response = await _client.get(Uri.http(_baseUrl , methodUrl));
     printHelper("response status code is ${response.statusCode}\n");
     printHelper("response status body is ${response.body}\n");
     if (response.statusCode == 200 || response.statusCode == 201) {
       return json.decode(response.body) as T;
     } else {
       throw StateError("response code is not 200. current code is ${response.statusCode}");
     }
  }

  Future<void> post<T>(
      String methodUrl,
      Map<String, String> jsonParam,
      Map<String, dynamic>? jsonBody,
      {
        required Future<void> Function(Map<String, dynamic>) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    printHelper("post method active $methodUrl\n");

    try {
      final response = await http.post(
          Uri.http(
              _baseUrl,
              methodUrl,
              jsonParam
          ),
          body: jsonEncode(jsonBody)
      ).timeout(
          const Duration(seconds: 5),
          onTimeout: () async {
            throw StateError("timeout Exception");
          }
      );

      printHelper("response status code is ${response.statusCode}\n");
      printHelper("response status body is ${response.body}\n");

      if (response.statusCode == 200 || response.statusCode == 201) {
        await onSuccess(json.decode(response.body));
      } else {
        await onFail("response code is not 200. current code is ${response.statusCode}");
      }
    } catch(e){
      printHelper("str");
      await onFail("$e");
    }
  }
}