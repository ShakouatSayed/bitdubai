class TransactionsModels {
  final String title;
  final String type; // Sent, Received, Pending
  final String amountCrypto;
  final String cryptoSymbol;
  final String amountFiat;
  final String date;
  final String time;
  final String status;
  final String hash;

  TransactionsModels({
    required this.title,
    required this.type,
    required this.amountCrypto,
    required this.cryptoSymbol,
    required this.amountFiat,
    required this.date,
    required this.time,
    required this.status,
    required this.hash,
  });

  factory TransactionsModels.fromJson(Map<String, dynamic> json) {
    return TransactionsModels(
      title: json["title"] ?? "",
      type: json["type"] ?? "",
      amountCrypto: json["amountCrypto"] ?? "",
      cryptoSymbol: json["cryptoSymbol"] ?? "",
      amountFiat: json["amountFiat"] ?? "",
      date: json["date"] ?? "" ?? "",
      time: json["time"] ?? "",
      status: json["status"] ?? "",
      hash: json["hash"] ?? "",
    );
  }
}
