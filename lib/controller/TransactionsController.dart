import 'dart:convert';

import 'package:bitdubai/model/TransactionsModels.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController {
  var transactions = <TransactionsModels>[].obs;
  var filteredTransactions = <TransactionsModels>[].obs;
  var selectedFilter = "All".obs;
  var searchQuery = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
   try{
     final jsonString = await rootBundle.loadString(
       "assets/data/TransactionsData.json",
     );
     final jsonData = jsonDecode(jsonString);
     final list = (jsonData["transactions"] as List)
         .map((e) => TransactionsModels.fromJson(e))
         .toList();
     transactions.value = list;
     filteredTransactions.value = list;
   }catch(e){
     print("Error Loading Transactions.$e");
   }
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
    applyFilters();
  }

  void setSearch(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  void applyFilters() {
    List<TransactionsModels> list = List.from(transactions);

    if (selectedFilter.value != "All") {
      final filter = selectedFilter.value.toLowerCase();
      // list = list
      //     .where(
      //       (tx) => tx.type.toLowerCase() == selectedFilter.value.toLowerCase(),
      //     )
      //     .toList();
      list = list.where((tx){
        switch(filter){
          case "sent" :
            return tx.type.toLowerCase() == "sent";
          case "received":
            return tx.type.toLowerCase() == "received";
          case "pending":
            return tx.type.toLowerCase() == "pending";
            default:
              return true;
        }
      }).toList();
    }

    if (searchQuery.value.isNotEmpty) {
      final query = searchQuery.value.toLowerCase();
      list = list
          .where(
            (tx) =>
                tx.title.toLowerCase().contains(query) ||
                tx.cryptoSymbol.toLowerCase().contains(query) ||
                tx.hash.toLowerCase().contains(query),
          )
          .toList();
    }
    filteredTransactions.value = list;
  }

  // Refresh transactions (for pull to refresh)
  Future<void> refreshTransactions() async{
    await loadTransactions();
  }
  // Clear all filters
  void clearFilters(){
    selectedFilter.value = "All";
    searchQuery.value = "";
    filteredTransactions.value = List.from(transactions);
  }
}
