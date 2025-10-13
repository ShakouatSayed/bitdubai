import 'package:bitdubai/model/BuySellModel.dart';
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


 }