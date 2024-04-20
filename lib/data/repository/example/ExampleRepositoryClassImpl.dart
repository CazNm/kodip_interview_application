
import 'package:sampl/data/datasource/ExampleDataSource.dart';
import 'package:sampl/data/dto/localDTO/ExampleDTO.dart';
import 'package:sampl/extenstions/networkToLocal.dart';

import 'ExampleRepositoryClass.dart';

class ExampleRepositoryClassImpl extends ExampleRepositoryClass {

  var exampleDataSource = ExampleDataSource();

  @override
  Future<ExampleDTO> getExample() async {
    var result = await exampleDataSource.getExample();
    return result.toLocalDTO();
  }

  @override
  Future<ExampleDTO> postExample(Map<String, String> body) {
    // TODO: implement postExample
    throw UnimplementedError();
  }

}