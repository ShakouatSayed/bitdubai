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
            _buildBeneficiarySection(),
            _buildAmountSections(),
            _buildExchangeDetails(),
            _buildSendButton(),
            _buildNoteCard(),
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
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.lock_clock, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Fast & Secure Transfer", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),
                Text("Money reaches within 1-2 business days", style: TextStyle(color: Colors.white, fontSize: 15))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeneficiarySection(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Beneficiary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              TextButton(onPressed: (){}, child: Text("+ Add Beneficiary")),
            ],
          ),
          SizedBox(height: 10),
          ...controller.sendAborad.map((e) {
            bool selected = controller.selectedSendAborad.value ?.id == e.id;
            return GestureDetector(
              onTap: () => controller.selectSendAborad(e),
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: selected ? Colors.deepPurple : Colors.grey.shade300, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                  color: selected ? Colors.deepPurple.withValues(alpha: 0.05) : Colors.white
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Icon(Icons.person, color: Colors.deepPurple),
                    ),
                    SizedBox(width: 12),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.name, style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("${e.flag} ${e.country} \n${e.bank}", style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    )),
                    if(selected)
                      Icon(Icons.check_circle, color: Colors.deepPurple),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAmountSections(){
    final amounts = [500, 1000, 2000, 5000];
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Transfer Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: TextField(
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(
                        text: controller.transferAmount.value.toStringAsFixed(0),
                      ),
                      onChanged: (val)  {
                        if(val.isNotEmpty){
                          controller.setTransferAmount(double.parse(val));
                        }
                      },
                      decoration: InputDecoration(border: InputBorder.none, hintText: "Enter Amount"),
                    )),
                    Text("AED", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                Text("Available:  ${controller.availableBalance.toStringAsFixed(2)} AED", style: TextStyle(color: Colors.grey, fontSize: 13)),
                SizedBox(height: 10)
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: amounts.map((e) {
              bool active = controller.transferAmount.value == e;
              return GestureDetector(
                onTap: () => controller.setTransferAmount(e.toDouble()),
                child: Container(
                  width: 70,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: active ? Colors.deepPurple : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: active ? Colors.deepPurple : Colors.grey.shade300),
                  ),
                  child: Center(child: Text(e.toString(), style: TextStyle(color: active ? Colors.white : Colors.black, fontWeight: FontWeight.w600))),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildExchangeDetails(){
    return Obx(() => Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Exchange Rate", style: TextStyle(fontWeight: FontWeight.w600)),
                Text("1 AED = ${controller.exchangeRate} INR")
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Fee", style: TextStyle(fontWeight: FontWeight.w600)),
                Text("${controller.fee} AED(${controller.feePercentage}%)"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Estimated Arrival", style: TextStyle(fontWeight: FontWeight.w600)),
                Text("1-2 days"),
              ],
            ),
            Divider(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recipient Receives", style: TextStyle(fontWeight: FontWeight.w600)),
                Text("${controller.recipientReceives.value.toStringAsFixed(2)} INR", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    ));
  }
  Widget _buildSendButton(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ), child: Text("Send Money", style: TextStyle(color: Colors.white, fontSize: 16))),
    );
  }
  
  Widget _buildNoteCard(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text("💡 Best rates guaranteed. Your beneficiary will receive the exact amount shown. No hidden charges.", style: TextStyle(fontSize: 13, color: Colors.deepPurple)),
      ),
    );
  }
}