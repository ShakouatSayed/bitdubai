import 'dart:convert';

import 'package:bitdubai/model/ProfileModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString(
      "assets/data/Profile.json",
    );
    final data = jsonDecode(response);
    profile.value = ProfileModel.fromJson(data);
  }

  // Toggle Dark Mode
  void toggleDarkMode() {
    if (profile.value != null) {
      profile.value ==
          ProfileModel(
            name: profile.value!.name,
            email: profile.value!.email,
            phone: profile.value!.phone,
            memberSince: profile.value!.memberSince,
            kycVerified: profile.value!.kycVerified,
            language: profile.value!.language,
            darkMode: !profile.value!.darkMode,
          );
    }
  }
}
