import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TransactionsController.dart';
import '../utils/Style.dart';

class HistoryPage extends StatelessWidget {
  final controller = Get.put(TransactionsController());
  HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCustomAppbar(),
          _buildTransactionsList(),
        ],
      ),
    );
  }

  Widget _buildCustomAppbar() {
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
                "Transactions History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: (val) => controller.setSearch(val),
              decoration: InputDecoration(
                hintText: "Search Transactions...",
                prefixIcon: Icon(Icons.search, size: 30),
                filled: true,
                fillColor: Color(0xFF10B1D3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Obx(() {
      if (controller.filteredTransactions.isEmpty) {
        return Center(child: Text("No Transactions Found"));
      }
      return Expanded(
        child: ListView.builder(
          itemCount: controller.filteredTransactions.length,
          itemBuilder: (context, index) {
            final tx = controller.filteredTransactions[index];


            final color = tx.type == "Received"
                ? Colors.green
                : tx.type == "Pending"
                ? Colors.orange
                : Colors.red;


            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color.withValues(alpha: 0.1),
                  child: Icon(
                    tx.type == "Received"
                        ? Icons.arrow_downward
                        : tx.type == "Sent"
                        ? Icons.arrow_upward
                        : Icons.pending,
                    color: color,
                  ),
                ),
                title: Text(
                  tx.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${tx.amountFiat} \n${tx.date} . ${tx.time}",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      tx.amountCrypto +
                          (tx.status == "Pending" ? (" Pending") : ""),
                      style: TextStyle(
                        color: tx.status == "Pending"
                            ? Colors.orange
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}