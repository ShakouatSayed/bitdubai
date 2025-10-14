class SendReceiveModel {
  final String name;
  final String symbol;
  final double balance;
  final String logoChar;
  final String address;

  SendReceiveModel({
    required this.name,
    required this.symbol,
    required this.balance,
    required this.logoChar,
    required this.address,
  });

  factory SendReceiveModel.fromJson(Map<String, dynamic> json) {
    return SendReceiveModel(
      name: json["name"],
      symbol: json["symbol"],
      balance: json["balance"].toDuble(),
      logoChar: json["logo_char"],
      address: json["address"],
    );
  }
}
