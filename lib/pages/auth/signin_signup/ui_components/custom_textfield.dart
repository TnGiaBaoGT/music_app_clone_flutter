import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController ? controller;
  final String? hintText;
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ThemeChecker.isDarkMode(context) ? const Color(0xffFFFFFF).withOpacity(0.14) : Colors.black.withOpacity(0.25),
          width: 1.1,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          color: const Color(0xffA7A7A7).withOpacity(0.8),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: const Color(0xffA7A7A7).withOpacity(0.6),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
