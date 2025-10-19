class SendAboradModel {
  final int id;
  final String name;
  final String country;
  final String bank;
  final String flag;

  SendAboradModel({
    required this.id,
    required this.name,
    required this.country,
    required this.bank,
    required this.flag,
  });
  factory SendAboradModel.fromJson(Map<String, dynamic> json) {
    return SendAboradModel(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      bank: json["bank"],
      flag: json["flag"],
    );
  }
}
