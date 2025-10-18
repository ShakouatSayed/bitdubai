import 'package:bitdubai/dashboardScreen/DashboardScreen.dart';
import 'package:bitdubai/historyPage/HistoryPage.dart';
import 'package:bitdubai/profilePage/ProfilePage.dart';
import 'package:bitdubai/transactionsScreen/TransactionsPage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.wallet), label: "Wallet"),
          NavigationDestination(icon: Icon(Icons.history), label: "History"),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: <Widget>[
        DashboardScreen(),
        TransactionsPage(),
        HistoryPage(),
        ProfilePage(),
      ][_currentIndex],
    );
  }
}
