import 'package:bitdubai/buySell/BuySell.dart';
import 'package:bitdubai/controller/DashboardController.dart';
import 'package:bitdubai/payMerchantPage/PayMerchantPage.dart';
import 'package:bitdubai/sendAbroadPage/SendAbroadPage.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sendReciveCrypto/SendReceiveCrypto.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInformationPart(),
              SizedBox(height: 20),
              _buildQuickActionPart(context),
              SizedBox(height: 20),
              _buildYourAssetsPart(),
              SizedBox(height: 20),
              _buildRecentTransactionsPart(),
            ],
          ),
        );
      }),
    );
  }

  // Information Part
  Widget _buildInformationPart() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A8ED9), Color(0xFF00C2AA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning  ☀️",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Icon(Icons.notifications_none, color: Colors.white, size: 20),
              ],
            ),
            SizedBox(height: 4),
            Text(
              controller.name.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Icon(Icons.visibility, size: 20, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${controller.balance.value.toStringAsFixed(2)} AED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "↝", style: TextStyle(color: Colors.green, fontSize: 38),
                      ),
                      Text(
                        "+12.5% ≈ \$14,280 USD",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionPart(BuildContext context) {
    final actions = [
      {"icon": Icons.swap_horiz, "label": "Buy/Sell", "color": Colors.blue, "onTap" :(){
        Navigator.push(context, MaterialPageRoute(builder: (_) => BuySell()));
      }},
      {"icon": Icons.arrow_upward, "label": "send", "color": Colors.green, "onTap" :(){
        Navigator.push(context, MaterialPageRoute(builder: (_) => SendReceiveCrypto()));
      }},
      {
        "icon": Icons.arrow_downward,
        "label": "receive",
        "color": Colors.orange,
        "onTap" :(){

        },
      },
      {"icon": Icons.send, "label": "Remittance", "color": Colors.purple, "onTap" :(){
        Navigator.push(context, MaterialPageRoute(builder: (_) => SendAbroadPage()));
      }},
      {"icon": Icons.qr_code, "label": "Pay Merchant", "color": Colors.pink, "onTap" :(){
        Navigator.push(context, MaterialPageRoute(builder: (_) => PayMerchantPage()));
      }},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: actions
                .map(
                  (a) => GestureDetector(
                    onTap: a["onTap"] as VoidCallback,
                    child: Container(
                      //alignment: Alignment.center,
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: (a["color"] as Color),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              (a["icon"] as IconData),
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            (a["label"] as String),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildYourAssetsPart() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Assets",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ...controller.assets.map(
              (asset) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset(asset.icon, width: 36),
                  title: Text(asset.name),
                  subtitle: Text(asset.subText),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${asset.amountAed} AED",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${asset.changePercent >= 0 ? "+" : ""}${asset.changePercent}%",
                        style: TextStyle(
                          color: asset.changePercent >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactionsPart() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ...controller.transactions.map(
              (e) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset(e.icon, width: 32),
                  title: Text(e.title),
                  subtitle: Text(e.timeAgo),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        e.subtitle,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        e.amountText,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
