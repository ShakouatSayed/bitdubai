import 'package:bitdubai/controller/BuySellController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuySell extends StatelessWidget{
  final controller = Get.put(BuySellController());
  BuySell({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: Obx((){
        if(controller.assets.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomAppbar(),
              SizedBox(height: 20),
              _buildAssetSelection(),
              SizedBox(height: 10),
              _buildPaymentSections(),
              SizedBox(height: 10),
              _buildExchangeSection(),
              SizedBox(height: 10),
              _buildQuickAmounts(),
              SizedBox(height: 10),
              _buildConfirmButton(),
              SizedBox(height: 10),
              _buildInfoCard(),
            ],
          ),
        );
      }),
      
    );
  }

  Widget _buildCustomAppbar(){
    return Container(
      //color: Color(0xFF0A8ED9),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: Color(0xFF0A8ED9),
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
                "Buy/Sell",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Buy","Sell"].map((mode) {
              bool active = controller.mode.value == mode;
              return Expanded(child: GestureDetector(
                onTap: () => controller.toggleMode(mode),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: active ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(mode, style: TextStyle(color: active? Colors.blue : Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ));
            }).toList(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
  
  Widget _buildAssetSelection() {
    return Obx(() => Row(
      mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      children: controller.assets.map((e){
        bool selected = controller.selectedAsset.value ?.symbol == e.symbol;
        return Expanded(child: GestureDetector(
          onTap: ()=> controller.selectedAsset(e),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(16),
            //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: selected ? Colors.blue.shade50 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: selected ? Colors.blue : Colors.transparent, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                      child: Image.asset(height: 10, width: 10,e.icon, fit: BoxFit.contain, scale: 5),
                                        ),
                    ),
                ]
                ),
                //SizedBox(width: 6),
               Column(
                 children: [
                   Text(e.name, style: TextStyle(fontWeight: FontWeight.bold)),
                   Text(e.symbol, style: TextStyle(color: Colors.grey)),
                 ],
               )
              ],
            ),
          ),
        ));
      }).toList(),
    ));
  }

  Widget _buildPaymentSections(){
    return Obx((){
      final selected = controller.selectedAsset.value!;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 15,
              offset: Offset(0, 2),
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("You Pay", controller.currency.value),
            TextField(
              keyboardType: TextInputType.number,
              //textInputAction: TextInputAction.none,
              decoration: InputDecoration(hintText: "0.00", border: InputBorder.none),
              //enabled: false,
              onChanged: (val) => controller.updatePay(double.tryParse(val) ?? 0),
            ),

            Text("Balance: ${controller.balance.value} AED", style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            SizedBox(height: 40),
            Center(
              child: Icon(Icons.swap_vert, color: Colors.blue, size: 30),
            ),
            _buildRow("You Receive", selected.symbol),
            Text(controller.receiveAmount.value.toStringAsFixed(6), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    });
  }

  Widget _buildExchangeSection()  {
    return Obx(() {
      final selected = controller.selectedAsset.value!;
      final rate = controller.mode.value == "Buy" ? selected.buyRate : selected.sellRate;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.grey,
              offset: Offset(0, 2),
            ),
          ]
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Exchange Rate: "),
               Text("1${selected.symbol} = $rate ${controller.currency.value}"),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Fee: "),
               Text("${controller.fee.toStringAsFixed(2)} ${controller.currency.value} (${controller.feePercent.value}%)"),
             ],
           ),
            Divider(thickness: 1, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: "),
                Text("${controller.total.toStringAsFixed(2)} ${controller.currency.value}"),
              ],
            ),


          ],
        ),
      );
    });
  }

  Widget _buildQuickAmounts(){
    return Obx(() => Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Wrap(
        spacing: 10,
        //runSpacing: 10,
        //crossAxisAlignment: WrapCrossAlignment.end,
        //alignment: WrapAlignment.spaceBetween,
        children: controller.amountOptions.map((amt){
          return OutlinedButton(onPressed:() => controller.updatePay(amt.toDouble()), child: Text("$amt"));
        }).toList(),
      ),
    ));
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ), child: Obx(() => Text(controller.mode.value =="Buy" ? "Confirm Buy" : "Confirm Sell", style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }

  Widget _buildInfoCard(){
    return Obx(() => SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.amber),
            SizedBox(width: 10),
            Expanded(child: Text(controller.infoText.value)),
          ],
        ),
      ),
    ));
  }

  Widget _buildRow(String left, String right){
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: TextStyle(color: Colors.grey)),
        Text(right, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}