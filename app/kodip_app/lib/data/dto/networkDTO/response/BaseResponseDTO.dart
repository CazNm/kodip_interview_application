class BaseResponseDTO {
  final String result;

  BaseResponseDTO({
    required this.result
  });

  factory BaseResponseDTO.fromJson(Map<String, dynamic> json) {
    return BaseResponseDTO(
      result: json["result"]
    );
  }
}

