import 'package:bitdubai/controller/PayMerchantController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboardScreen/StartPage.dart';

class PayMerchantPage extends StatelessWidget{
  final PayMerchantController controller = Get.put(PayMerchantController());
  PayMerchantPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCustomAppbar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppbar(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: Colors.pink,
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
                "Pay Merchant",
                style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 8
                )
              ]
            ),
            child: Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}