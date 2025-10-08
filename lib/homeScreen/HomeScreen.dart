import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E88E5), Color(0xFF1A73E8), Color(0xFF0DB39E)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),

                // Box Icon
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.28,
                      height: screenWidth * 0.28,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Transform.rotate(
                        angle: -0.12,
                        child: Icon(
                          Icons.currency_bitcoin,
                          size: screenWidth * 0.12,
                          color: Colors.white.withValues(alpha: 0.95),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),

                // BitDubai
                Text(
                  "BitDubai",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),

                // Welcome Text
                Text(
                  "Welcome to BitDubai",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 48),

                // Selected Language
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                    child: Container(
                      width: screenWidth * 0.82,
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Select Language",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 18),

                          // Language buttons row
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              // English
                              GestureDetector(
                                onTap: () {
                                  setState(() => selected = 0);
                                },
                                child: Container(
                                  width: screenWidth * 0.28,
                                  height: screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                    color: selected == 0
                                        ? Colors.white
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: selected == 0
                                          ? Colors.green
                                          : Colors.white.withValues(
                                              alpha: 0.10,
                                            ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "English",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: selected == 0
                                            ? Color(0xFF1A73E8)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Arabic
                              GestureDetector(
                                onTap: () {
                                  setState(() => selected = 1);
                                },
                                child: Container(
                                  width: screenWidth * 0.28,
                                  height: screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                    color: selected == 1
                                        ? Colors.green
                                        : Colors.white.withValues(
                                            alpha: 0.10,
                                          ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.18,
                                      ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "العربية",
                                      style: TextStyle(
                                        color: selected == 1
                                            ? Colors.white
                                            : Colors.white12,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          // Continue button
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () {
                                final lang = selected == 0 ? "en" : "ar";
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Selected: $lang"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF6A623),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 6,
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "Version 1.0.0 MVP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white12.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
                // Expanded to push version to button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
