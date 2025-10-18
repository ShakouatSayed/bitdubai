class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String memberSince;
  final bool kycVerified;
  final String language;
  final bool darkMode;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.memberSince,
    required this.kycVerified,
    required this.language,
    required this.darkMode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      memberSince: json["memberSince"],
      kycVerified: json["kycVerified"],
      language: json["language"],
      darkMode: json["darkMode"],
    );
  }
}
