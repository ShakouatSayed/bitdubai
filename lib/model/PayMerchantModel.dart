class PayMerchantModel {
  final int id;
  final String name;
  final String lastPaid;

  PayMerchantModel({
    required this.id,
    required this.name,
    required this.lastPaid,
  });

  factory PayMerchantModel.fromJson(Map<String, dynamic> json) {
    return PayMerchantModel(
      id: json["id"],
      name: json["json"],
      lastPaid: json["lastPaid"],
    );
  }
}
