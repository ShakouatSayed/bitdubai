import 'package:bitdubai/controller/TransactionsController.dart';
import 'package:bitdubai/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsPage extends StatelessWidget {
  final controller = Get.put(TransactionsController());
  TransactionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraoundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomAppbar(),
            SizedBox(height: 20),
            _buildToggleFilters(),
            SizedBox(height: 20),
            _buildTransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppbar() {
    return Container(
      //color: Color(0xFF0A8ED9),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
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
                "Transactions",
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
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildToggleFilters() {
    final filters = ["All", "Sent", "Received", "pending"];
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filters.map((filter) {
          bool active = controller.selectedFilter.value == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.setFilter(filter),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: active ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Center(
                  child: Text(
                    filter,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Obx(() {
      if (controller.filteredTransactions.isEmpty) {
        return Center(child: Text("No Transactions Found"));
      }
      return ListView.builder(
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
                      : Icons.autorenew,
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
                        (tx.status == "Pending" ? ("Pending") : ""),
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
      );
    });
  }
}
