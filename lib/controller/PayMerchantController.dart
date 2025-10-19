import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/PayMerchantModel.dart';

class PayMerchantController extends GetxController {
  var merchants = <PayMerchantModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString(
      "assets/data/PayMerchantData.json",
    );
    final List data = jsonDecode(response);
    merchants.value = data.map((e) => PayMerchantModel.fromJson(e)).toList();
  }
}
