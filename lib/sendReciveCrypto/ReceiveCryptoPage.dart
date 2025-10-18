import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../controller/SendReceiveController.dart';
import '../model/SendReceiveModel.dart';

class ReceiveCryptoPage extends StatelessWidget{
  const ReceiveCryptoPage({super.key});
  @override
  Widget build(BuildContext context){
    final controller = Get.find<SendReceiveController>();
    final Color primaryColor = Color(0xFF3ED6A4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Select Asset to receive", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            )
        ),
        SizedBox(height: 12),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.min,
          children: controller.assets.map((e){
            bool isSelected = controller.selectedAsset.value?.symbol == e.symbol;
            return _buildAssetCard(e, isSelected, () => controller.selectedAsset(e));
          }).toList(),
        )),

        SizedBox(height: 20),
        _buildAddressCard(controller),
        _buildWarningCard(controller),
        SizedBox(height: 20)

      ],
    );
  }

  // Asset card widget
  Widget _buildAssetCard(SendReceiveModel asset, bool isSelected, VoidCallback onTap){
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical : 12, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? Color(0xFF3ED6A4) : Colors.grey.shade600, width: 1.5),
          ),
          child: Row(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: isSelected ? Color(0xFFE3F8F1) : Color(0xFFF5F5F5),
                        radius: 16,
                        child: Text(asset.logoChar, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ]),
                SizedBox(width: 12),
                Column(
                  children: [
                    Text(asset.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(asset.symbol, style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  // Qr Code Part
  Widget _buildAddressCard(SendReceiveController controller){
    String address = controller.selectedAsset.value!.address;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12,
            offset: Offset(0, 3)
          ),
        ]
      ),
      child: Column(
        children: [
          Text("Your Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),

          // QR Code
          Container(
            padding: EdgeInsets.all(8),

            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
            child: QrImageView(data: address, version: QrVersions.auto, size: 200.0),
          ),
          SizedBox(height: 10),

          // Address Text
          Text(address, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          SizedBox(height: 20),

          // Copy Button
          OutlinedButton.icon(onPressed: controller.copyAddress,icon: Icon(Icons.copy_outlined, size: 18), label: Text("Copy Address"), style: OutlinedButton.styleFrom(
           foregroundColor: Colors.black,
           side: BorderSide(color: Colors.grey.shade300),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          )),

        ],
      ),
    );
  }

  // Info Card
  Widget _buildWarningCard(SendReceiveController controller){
    String name = controller.selectedAsset.value!.name;
    String symbol = controller.selectedAsset.value!.symbol;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
            SizedBox(width: 12),
            Expanded(child: Text("Only send $name ($symbol) to this address. sending any other cryptocurrency my result in permanent loss", style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }

}