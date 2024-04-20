class TransactionSummaryNetworkDTO {
  final int tr_id;
  final String tr_title;
  final int tr_amount;
  final String tr_currency;
  final String tr_ico;
  final String tr_type;

  TransactionSummaryNetworkDTO({
    required this.tr_id,
    required this.tr_title,
    required this.tr_amount,
    required this.tr_currency,
    required this.tr_ico,
    required this.tr_type
  });

  factory TransactionSummaryNetworkDTO.fromJson(Map<String, dynamic> json) {
    return TransactionSummaryNetworkDTO(
        tr_id: json["tr_id"],
        tr_title: json["tr_title"],
        tr_amount: json["tr_amount"],
        tr_currency: json["tr_currency"],
        tr_ico: json["tr_ico"],
        tr_type: json["tr_type"]
    );
  }
}

