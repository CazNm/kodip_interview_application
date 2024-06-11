class UserNetworkDTO {
  final String name;
  final int deposit_amount;

  UserNetworkDTO({
    required this.name,
    required this.deposit_amount
  });

  factory UserNetworkDTO.fromJson(Map<String, dynamic> json) {
    return UserNetworkDTO(
        name: json["name"],
        deposit_amount: json["deposit_amount"]
    );
  }
}

