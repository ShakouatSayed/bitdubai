import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget{
  final String imagePath;
  final String title;
  final String subtitle;
  const OnboardingCard({super.key, required this.imagePath, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(
        //     //padding: EdgeInsets.all(20),
        //   //margin: EdgeInsets.symmetric(horizontal: 16),
        //   width: screenWidth * 0.3,
        //   height: screenWidth * 0.3,
        //   decoration: BoxDecoration(
        //     color: Color(0xFFE7F0FB),
        //     borderRadius: BorderRadius.circular(22),
        //   ),
        //   child: Icon(icon, color: Color(0xff0A68F5), size: screenWidth * 0.18),
        // ),
        SizedBox(
          width: screenWidth * 0.6,
          height: screenHeight * 0.22,
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
        SizedBox(height: 36),

        // Title text
        Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87)),
        SizedBox(height: 12),

        // Subtitle text
        Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text(subtitle, style: TextStyle(
          color: Color(0xFF7C8AA5),
          fontSize: 15
        ))),
      ],
    );
  }

}