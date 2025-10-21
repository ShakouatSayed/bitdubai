import 'package:bitdubai/controller/PayMerchantController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboardScreen/StartPage.dart';

class PayMerchantPage extends StatelessWidget {
  final controller = Get.put(PayMerchantController());
  PayMerchantPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCustomAppbar(context),
            SizedBox(height: 20),
            _buildQrSections(),
            _buildPaySections(),
            _buildMerchantSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppbar(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage()),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(width: 10),
              Text(
                "Pay Merchant",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink.shade400,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Text(
              "Scan Merchant QR Code",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrSections() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withValues(alpha: 0.2), blurRadius: 8),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.2))],
            ),
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFFFF2FB9)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code_2_outlined,
                      color: Colors.pinkAccent,
                      size: 150,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Position the QR code within the frame",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Simulate Scan(Demo)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaySections() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How to pay: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Text("1", style: TextStyle(color: Colors.white)),
            ),
            title: Text("Ask the merchant to show their payment QR code"),
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Text("2", style: TextStyle(color: Colors.white)),
            ),
            title: Text("Scan the QR code with your camera"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Text("3", style: TextStyle(color: Colors.white)),
            ),
            title: Text("Review payment details and confirm"),
          ),
        ],
      ),
    );
  }

  Widget _buildMerchantSection() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Merchants",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Obx(()=> Column(
              children: controller.merchants.map((e) => Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 5,
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Color(0xFFFFE1EC), shape: BoxShape.circle),
                      child: Icon(Icons.storefront, color: Colors.pinkAccent),
                    ),
                    SizedBox(width: 12),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(e.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                      Text("Last paid: ${e.lastPaid}", style: TextStyle(color: Colors.grey))
                    ],)
                  ],
                ),
              )).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
