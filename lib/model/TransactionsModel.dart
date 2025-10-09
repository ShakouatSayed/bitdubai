class TransactionsModel {
  final String title;
  final String subtitle;
  final String amountText;
  final String timeAgo;
  final String icon;
  final bool isPositive;

  TransactionsModel({
    required this.title,
    required this.subtitle,
    required this.amountText,
    required this.timeAgo,
    required this.icon,
    required this.isPositive,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      title: json["title"],
      subtitle: json["subtitle"],
      amountText: json["amount_text"],
      timeAgo: json["time_ago"],
      icon: json["icon"],
      isPositive: json["is_positive"],
    );
  }
}
