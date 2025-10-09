class AssetModel {
  final String name;
  final String subText;
  final double amountAed;
  final double changePercent;
  final String icon;


  AssetModel({
    required this.name,
    required this.subText,
    required this.amountAed,
    required this.changePercent,
    required this.icon,

  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      name: json["name"],
      subText: json["sub_text"],
      amountAed: json["amount_aed"].toDouble(),
      changePercent: json["change_percent"].toDouble(),
      icon: json["icon"],

    );
  }
}
