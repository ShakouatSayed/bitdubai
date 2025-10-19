import 'package:bitdubai/controller/SendAboradController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboardScreen/StartPage.dart';

class SendAbroadPage extends StatelessWidget{
  final controller = Get.put(SendAboradController());
  SendAbroadPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: Obx(() => controller.sendAborad.isEmpty ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        //padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppbar(context),
          ],
        ),
      )),
    );
  }

  Widget _buildCustomAppbar(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: Colors.deepPurpleAccent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(width: 10),
              Text(
                "Send Money Abroad",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(

          ),
        ],
      ),
    );
  }
}