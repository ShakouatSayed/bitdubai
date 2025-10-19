import 'dart:convert';

import 'package:bitdubai/model/SendAbord.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SendAboradController extends GetxController{
  var sendAborad = <SendAboradModel>[].obs;
  var selectedSendAborad = Rxn<SendAboradModel>();

  var transferAmount = 1000.0.obs;
  final availableBalance = 52450.75;
  final exchangeRate = 22.50;
  final fee = 15.00;
  final feePercentage = 1.5;
  var recipientReceives = 0.0.obs;

  @override
  void onInit(){
    super.onInit();
    loadData();
    calculateRecipientAmount();
  }

  Future<void> loadData() async {
    final jsonString = await rootBundle.loadString("assets/data/SendAborad.json");
    final data = jsonDecode(jsonString);
    sendAborad.value = (data["beneficiaries"] as List).map((e) => SendAboradModel.fromJson(e)).toList();
    selectedSendAborad.value = sendAborad.first;
  }

  void selectSendAborad(SendAboradModel sendAborad){
    selectedSendAborad.value = sendAborad;
  }

  void setTransferAmount(double amount){
    transferAmount.value = amount;
  }

  void calculateRecipientAmount(){
    double total = transferAmount.value * exchangeRate;
    double totalFee = fee + (transferAmount.value * feePercentage / 100);
    recipientReceives.value = total - totalFee;
  }
}