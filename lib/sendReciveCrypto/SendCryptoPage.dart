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
        Obx(() => Row(
          children: controller.assets.map((e){
            bool isSelected = controller.selectedAsset.value?.symbol == e.symbol;
            return Expanded(child: _buildAssetCard(e, isSelected, () => controller.selectedAsset(e)));
          }).toList(),
        ))
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
          color: isSelected ? Color(0xFFE3F8F1) : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Color(0xFF3ED6A4) : Colors.grey.shade600),
        ),
        child: Column(

        ),
      ),
    );
  }
}