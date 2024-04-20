import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sampl/util/debugPrint.dart';

class HttpClientLocal {

  final _client = http.Client();

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

  Future<void> post(
      String methodUrl,
      String hashedParam,
      Map<String, String>? jsonBody,
      {
        required Future<void> Function(dynamic) onSuccess,
        required Future<void> Function(String) onFail
      }
  ) async {
    printHelper("post method active $methodUrl\n");

    final response = await http.post(
        Uri.http(
            _baseUrl,
            methodUrl,
            {"hashed" : hashedParam}
        ),
        body: jsonBody
    ).timeout(
        const Duration(seconds: 5),
        onTimeout: () async {
          await onFail("timeOut");
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
  }
}