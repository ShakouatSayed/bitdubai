import 'dart:ui';
import 'package:flutter/material.dart';

Color primaryBlue = Color(0xFF0A68F5);
Color fieldFill = Color(0xFFF1F6FA);
Color backgraoundColor = Color(0xFFF8FAFD);

// Outline Input border decoration
OutlineInputBorder fieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: Color(0xFFE6EEF6), width: 1.0)
);


// Input Decoration
InputDecoration buildDecoration({
  required String hint,
  required IconData prefix,
  Widget? suffix,
}){
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: fieldFill,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    prefixIcon: Icon(prefix, color: Color(0xFF7C8AA5)),
    suffixIcon: suffix,
    enabledBorder: fieldBorder,
    focusedBorder: fieldBorder.copyWith(borderSide: BorderSide(color: Color(0xFFE6EEF6), width: 1.0)),
    hintStyle: TextStyle(color: Color(0xFF9AA9BA)),
  );
}