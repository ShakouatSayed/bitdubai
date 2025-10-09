import 'dart:convert';

import 'package:bitdubai/model/AssetsModel.dart';
import 'package:bitdubai/model/TransactionsModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Reactive state variables
  var name = "".obs;
  var balance = 0.0.obs;
  var balanceUsd = 0.0.obs;
  var changePercent = 0.0.obs;
  var assets = <AssetModel>[].obs;
  var transactions = <TransactionsModel>[].obs;

  // Loading state
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      // Load JSON from assets
      final String response = await rootBundle.loadString(
        "assets/data/DashboardData.json",
      );
      final data = json.decode(response);

      // Assign data to reactive variables
      name.value = data["name"];
      balance.value = data["balance"].toDouble;
      balanceUsd.value = data["balance_usd"].toDouble;
      changePercent.value = data["change_percent"].toDouble;

      assets.value = (data["assets"] as List)
          .map((item) => AssetModel.fromJson(item))
          .toList();

      transactions.value = (data["transactions"] as List)
          .map((item) => TransactionsModel.fromJson(item))
          .toList();
      isLoading.value = false;
    } catch (e) {
      print("Error loading dashboard data: $e");
    }
  }
}
