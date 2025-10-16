import 'package:bitdubai/controller/SendReceiveController.dart';
import 'package:bitdubai/model/SendReceiveModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendCryptoPage extends StatelessWidget{
  const SendCryptoPage({super.key});
  @override
  Widget build(BuildContext context){
    final controller = Get.find<SendReceiveController>();
    final Color primaryColor = Color(0xFF3ED6A4);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Asset", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 12),
        Obx(() => Wrap(
          children: controller.assets.map((e){
            bool isSelected = controller.selectedAsset.value?.symbol == e.symbol;
            return _buildAssetCard(e, isSelected, () => controller.selectedAsset(e));
          }).toList(),
        )),

        SizedBox(height: 20),
        _buildTextField(label: "Recipient Address", controller: controller.addressController, hintText: "bc1q...", suffixIcon: Icon(Icons.qr_code_scanner_outlined, color: Colors.grey)),
        SizedBox(height: 20),
        Obx(() => _buildAmountField(context, controller)),
        SizedBox(height: 20),
        _buildNetworkFeeCard(),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Obx(() => ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ), child: Text("Send ${controller.selectedAsset.value?.name ?? ""}",style: TextStyle(fontSize: 18, color: Colors.white)))),
        ),
      ],
    );
  }

  // Asset card widget
  Widget _buildAssetCard(SendReceiveModel asset, bool isSelected, VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFACDDCF) : Color(0xFFC62E2E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Color(0xFF3ED6A4) : Colors.grey.shade600, width: 1.5),
        ),
        child: Row(
          children: [
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: isSelected ? Color(0xFFE3F8F1) : Color(0xFFF5F5F5),
                child: Text(asset.logoChar, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              ]),
              // SizedBox(height: 12),
           Column(
             children: [
               Text(asset.name, style: TextStyle(fontWeight: FontWeight.bold)),
               Text(asset.symbol, style: TextStyle(color: Colors.grey.shade600)),
             ],
           ),
        ]),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField({required String label, required TextEditingController controller, String? hintText, Widget? suffixIcon}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF3ED6A4))),
          ),
        ),
      ],
    );
}

  // Amount filed widget
  Widget _buildAmountField(BuildContext context, SendReceiveController controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        TextField(
          controller: controller.amountController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: "0.00",
            helperText: "≈ 0 AED",
            helperStyle: TextStyle(color: Colors.grey),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.selectedAsset.value?.symbol ?? "", style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
                TextButton(onPressed: controller.setMaxAmount, child: Text("Max", style: TextStyle(color: Color(0xFF3ED6A4)))),
              ],
            ),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF3ED6A4))),
          ),
        ),
      ],
    );
}

  // NetWork fee card Widget
  Widget _buildNetworkFeeCard(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text("Network Fee", style: TextStyle(color: Colors.grey.shade700)),
          Text("0.0001 BTC (≈ 18 AED)", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
}
}