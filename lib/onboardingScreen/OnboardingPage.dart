import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget{
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>{
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Map<String, dynamic>> onboardingData = [
    {
      "imagePath" : "assets/images/bit_curr.png",
      "title" : "Buy & Sell Bitcoin",
      "subtitle" : "Trade Bitcoin and USDT with AED instantly",
    },
    {
      "imagePath" : "assets/images/send_img.png",
      "title" : "Buy & Sell Bitcoin",
      "subtitle" : "Trade Bitcoin and USDT with AED instantly",
    },
    {
      "imagePath" : "assets/images/qr_code.png",
      "title" : "Buy & Sell Bitcoin",
      "subtitle" : "Trade Bitcoin and USDT with AED instantly",
    }
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFD),
      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(
        horizontal: 24, vertical: 16
      ), child: Column(
        children: [
          // Header row (Dots + Skip)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
              List.generate(
                  onboardingData.length,
                      (index)=> Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: _buildDot,
                      )),
          ),
        ],
      ))),
    );
  }
}