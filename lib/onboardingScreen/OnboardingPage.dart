import 'package:bitdubai/onboardingScreen/OnboardingCard.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Map<String, dynamic>> onboardingData = [
    {
      "imagePath": "assets/images/bit_curr.png",
      "title": "Buy & Sell Bitcoin",
      "subtitle": "Trade Bitcoin and USDT with AED instantly",
    },
    {
      "imagePath": "assets/images/send_img.png",
      "title": "Buy & Sell Bitcoin",
      "subtitle": "Trade Bitcoin and USDT with AED instantly",
    },
    {
      "imagePath": "assets/images/qr_code.png",
      "title": "Buy & Sell Bitcoin",
      "subtitle": "Trade Bitcoin and USDT with AED instantly",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFD),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Header row (Dots + Skip)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: List.generate(      
                      onboardingData.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: _buildDot(index == _currentPage),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(onboardingData.length - 1);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.08),

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemBuilder: (context, index) => OnboardingCard(
                    imagePath: onboardingData[index]["imagePath"],
                    title: onboardingData[index]["title"],
                    subtitle: onboardingData[index]["subtitle"],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Bottom Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(onPressed: (){
                  if(_currentPage == onboardingData.length - 1){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Get Started Clicked!"),));
                  }else{
                    _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                  }
                },style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A68F5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ), child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Get started text
                    Text(_currentPage == onboardingData.length - 1 ? "Get Started" : "Next", style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(width: 6),

                    // Arrow Icon
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),

                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 250),
      width: isActive ? 22 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF0A68F5) : Color(0xFFD9E2EF),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
