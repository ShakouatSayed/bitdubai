import 'dart:convert';

import 'package:bitdubai/model/TransactionsModels.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController {
  var transactions = <TransactionsModels>[].obs;
  var filteredTransactions = <TransactionsModels>[].obs;
  var selectedFilter = "All".obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    final jsonString = await rootBundle.loadString(
      "assets/data/transactionsData.json",
    );
    final jsonData = jsonDecode(jsonString);
    final list = (jsonData["transactions"] as List)
        .map((e) => TransactionsModels.fromJson(e))
        .toList();
    transactions.value = list;
    filteredTransactions.value = list;
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
    var list = transactions;

    if (selectedFilter.value != "All") {
      list = list
          .where(
            (tx) => tx.type.toLowerCase() == selectedFilter.value.toLowerCase(),
          )
          .toList()
          .obs;
    }

    if (searchQuery.value.isNotEmpty) {
      list = list
          .where(
            (tx) =>
                tx.title.toLowerCase().contains(
                  searchQuery.value.toLowerCase(),
                ) ||
                tx.cryptoSymbol.toLowerCase().contains(
                  searchQuery.value.toLowerCase(),
                ),
          )
          .toList()
          .obs;
    }
    filteredTransactions.value = list;
  }
}
