import 'package:bitdubai/dashboardScreen/StartPage.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget{
  const TransactionsPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgraoundColor,
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF0A8ED9),
      //   //toolbarHeight: 100,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //   leading: IconButton(onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
      //   }, icon: Icon(Icons.arrow_back)),
      //   title: Text("Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      // ),
      body: Container(
        //color: Color(0xFF0A8ED9),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFF0A8ED9)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}