
import 'dart:io';
import '../dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';
import '../httpClient/HttpClientLocal.dart';

class ExampleDataSource {
  HttpClientLocal _httpClient = HttpClientLocal();

  Future<ExampleNetworkDTO> getExample() async {
    return _httpClient.get<ExampleNetworkDTO>("exampleGet");
  }

  // Future postExample(Map<String, String> body) async {
  //   return _httpClient.post("examplePost", body);
  // }
}