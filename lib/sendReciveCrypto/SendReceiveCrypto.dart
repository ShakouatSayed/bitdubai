import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/SendReceiveController.dart';
import '../utils/Style.dart';
import 'ReceiveCryptoPage.dart';
import 'SendCryptoPage.dart';

class SendReceiveCrypto extends StatelessWidget{
  final controller = Get.put(SendReceiveController());
  SendReceiveCrypto({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCustomAppbar(context, controller),
          SizedBox(height: 24),

          Expanded(child: SingleChildScrollView(
            child: Obx(() {
              if(controller.isSendSelected.value){
                return SendCryptoPage();
              }else{
                return ReceiveCryptoPage();
              }
            }),
          ))
        ],
      ),
    );
  }

  Widget _buildCustomAppbar(BuildContext context, SendReceiveController controller){
    return Obx(() => Center(child: Container(
      //color: Color(0xFF0A8ED9),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: Color(0xFF00C2AA),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(width: 10),
              Text(
                "Send Crypto/Receive Crypto",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ToggleButtons(
              isSelected: [controller.isSendSelected.value, !controller.isSendSelected.value],
              onPressed: controller.onToggleMode,
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.black,
              fillColor: Colors.white,
              borderWidth: 0,
              borderColor: Colors.transparent,
              constraints: BoxConstraints(minHeight: 40, minWidth: (MediaQuery.of(context).size.width - 48) / 2),
              children: [
                Text("Send",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Receive", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    )));
  }
}