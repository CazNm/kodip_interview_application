class ExampleDTO {
  final String id;
  final String example;

  ExampleDTO({
    required this.id,
    required this.example
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'example': example,
  };
}