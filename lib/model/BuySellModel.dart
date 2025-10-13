class BuySellModel {
  final String name;
  final String symbol;
  final String icon;
  final double buyRate;
  final double sellRate;

  BuySellModel({
    required this.name,
    required this.symbol,
    required this.icon,
    required this.buyRate,
    required this.sellRate,
  });

  factory BuySellModel.fromJson(Map<String, dynamic> json) {
    return BuySellModel(
      name: json["name"],
      symbol: json["symbol"],
      icon: json["icon"],
      buyRate: json["buyRate"].toDouble(),
      sellRate: json["sellRate"].toDouble(),
    );
  }
}
