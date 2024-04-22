class TransactionSummaryNetworkDTO {
  final int tr_id;
  final String tr_title;
  final int tr_amount;
  final String tr_currency;
  final String tr_ico;
  final String tr_type;
  final String tr_dt;

  TransactionSummaryNetworkDTO({
    required this.tr_id,
    required this.tr_title,
    required this.tr_amount,
    required this.tr_currency,
    required this.tr_ico,
    required this.tr_type,
    required this.tr_dt
  });

  factory TransactionSummaryNetworkDTO.fromJson(Map<String, dynamic> json) {

    var amount = json["tr_amount"];

    if(amount.runtimeType == double) {
      amount = (amount as double).round();
    }

    return TransactionSummaryNetworkDTO(
        tr_id: json["tr_id"],
        tr_title: json["tr_title"],
        tr_amount: amount,
        tr_currency: json["tr_currency"],
        tr_ico: json["tr_ico"],
        tr_type: json["tr_type"],
        tr_dt: json["tr_dt"]
    );
  }
}

