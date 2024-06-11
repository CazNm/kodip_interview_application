class ExampleNetworkDTO {
  final int code;
  final String msg;
  final String id;
  final String example;

  ExampleNetworkDTO({
    required this.code,
    required this.msg,
    required this.id,
    required this.example
  });

  factory ExampleNetworkDTO.fromJson(Map<String, dynamic> json) {
    return ExampleNetworkDTO(
        code: json["code"],
        msg: json["msg"],
        id: json["id"],
        example: json["author"]
    );
  }
}

