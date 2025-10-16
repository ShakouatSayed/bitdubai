import 'dart:convert';

import 'package:bitdubai/model/SendReceiveModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SendReceiveController extends GetxController{

  // Static variable reactive
  var isSendSelected = true.obs;
  var assets = <SendReceiveModel>[].obs;
  var selectedAsset = Rxn<SendReceiveModel?>(null);

  final addressController = TextEditingController();
  final amountController = TextEditingController();

  // onInit() this getx controller live them constructor
  @override
  void onInit(){
    super.onInit();
    loadData();
  }

  // JSON file to assets load function
  Future<void> loadData() async{
    final String response = await rootBundle.loadString("assets/data/SendReceiveData.json");
    final List<dynamic> data = jsonDecode(response);

    // Added to the assets list
    assets.value = data.map((e) => SendReceiveModel.fromJson(e)).toList();
    if(assets.isNotEmpty){
      // Default selected first assets
      selectedAsset.value = assets.first;
    }
  }

  // Send receive toggle changed function
  void onToggleMode (int index){
    isSendSelected.value = (index == 0);
  }

  // Selected Assets function
  void selectAsset(SendReceiveModel asset){
    selectedAsset.value = asset;
    if(isSendSelected.value){
      amountController.clear();
    }
  }

  // Click max button fully complete balance set function
  void setMaxAmount(){
    if(selectedAsset.value != null){
      amountController.text = selectedAsset.value!.balance.toString();
    }
  }

  // Address copy for this function
  void copyAddress(){
    if(selectedAsset.value != null){
      Clipboard.setData(ClipboardData(text: selectedAsset.value!.address));
      Get.snackbar("Copied", "Address copied to clipboard", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white, colorText: Colors.white);
    }
  }

  // Controller delete time text controller dispose
  @override
  void onClose(){
    addressController.dispose();
    amountController.dispose();
    super.onClose();
  }
}