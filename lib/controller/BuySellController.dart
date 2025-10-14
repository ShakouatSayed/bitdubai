import 'dart:convert';

import 'package:bitdubai/model/BuySellModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuySellController extends GetxController{
  var assets = <BuySellModel>[].obs;
  var selectedAsset = Rxn<BuySellModel>();
  var balance = 0.0.obs;
  var currency = "".obs;
  var feePercent = 0.0.obs;
  var amountOptions = <int>[].obs;
  var infoText = "".obs;
  var payAmount = 0.0.obs;
  var receiveAmount = 0.0.obs;
  var mode = "Buy".obs;

  @override
  void onInit(){
    super.onInit();
    loadData();
  }

  Future<void> loadData() async{
    final jsonString = await rootBundle.loadString("assets/data/BuySellData.json");
    final jsonData = jsonDecode(jsonString);

    balance.value = jsonData["balance"];
    currency.value = jsonData["currency"];
    feePercent.value = jsonData["feePercent"].toDouble();
    amountOptions.value = List<int>.from(jsonData["amountOptions"]);
    infoText.value = jsonData["infoText"];

    assets.value = (jsonData["assets"] as List).map((e) => BuySellModel.fromJson(e)).toList();
    selectedAsset.value = assets.first;
  }

  void toggleMode(String newMode){
    mode.value = newMode;
    calculateReceive();
  }

  void selectAsset(BuySellModel asset){
    selectedAsset.value = asset;
    calculateReceive();
  }

  void updatePay(double value){
    payAmount.value = value;
    calculateReceive();
  }

  void calculateReceive(){
    if(selectedAsset.value == null) return;
    double rate = mode.value == "Buy" ? selectedAsset.value !.buyRate : selectedAsset.value!.sellRate;
    receiveAmount.value = payAmount.value / rate;
  }

  double get fee => payAmount.value * feePercent.value / 100;
  double get total => payAmount.value + fee;

 }