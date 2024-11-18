import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextStyle textStyle;
  final bool isObscure;
  final double rad;
  final TextEditingController controller;

  const myTextField({super.key, required this.hintText, required this.isObscure, required this.textStyle, required this.rad, required this.controller, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: isObscure,
        style: textStyle,
        decoration: InputDecoration(hintText: hintText, border: OutlineInputBorder(borderRadius: BorderRadius.circular(rad))),
      ),
    );
  }
}
