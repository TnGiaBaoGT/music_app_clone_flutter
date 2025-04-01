import 'package:flutter/material.dart';

class SignInRegisterShortcut extends StatelessWidget {
  final String text1;
  final String text2;
  final Function()? onTap;
  const SignInRegisterShortcut({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1 ,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        GestureDetector(
          onTap: onTap,
          child: Text(text2,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff288CE9),
              fontWeight: FontWeight.bold,
            ),),
        ),
      ],
    );
  }
}
