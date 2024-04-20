

import '../../dto/localDTO/ExampleDTO.dart';
import '../../dto/networkDTO/networkDTO/ExampleNetworkDTO.dart';

abstract class ExampleRepositoryClass {

  Future<ExampleDTO> getExample();

  Future<ExampleDTO> postExample(Map<String, String> body);
}