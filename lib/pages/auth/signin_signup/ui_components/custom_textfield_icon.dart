import 'package:flutter/material.dart';
import '../../../../app_config/theme_checker.dart';


class CustomTextfieldIcon extends StatefulWidget {
  final String? hintText;
  final TextEditingController ? controller;
  const CustomTextfieldIcon({
    super.key,
    this.hintText,
    this.controller,
  });

  @override
  State<CustomTextfieldIcon> createState() => _CustomTextfieldIconState();
}

class _CustomTextfieldIconState extends State<CustomTextfieldIcon> {
  bool isObscureText = true;

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
        obscureText: isObscureText,
        style: TextStyle(
          color: const Color(0xffA7A7A7).withOpacity(0.8),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          suffixIcon:
          GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: isObscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),

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