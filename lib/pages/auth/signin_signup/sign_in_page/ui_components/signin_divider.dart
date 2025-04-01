import 'package:flutter/material.dart';
import '../../ui_components/custom_divider.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDivider(
          color1: Colors.white.withOpacity(0.25), // Màu nhạt ở đầu
          color2: Colors.grey.withOpacity(0.1), // Màu nhạt ở cuối
        ),
        const SizedBox(width: 6),
        const Text('Or',
          style: TextStyle(
            color: Color(0xffDCDCDC),
            fontSize: 12,
          ),),
        const SizedBox(width: 6),
        CustomDivider(
          color1: Colors.grey.withOpacity(0.1), // Màu nhạt ở đầu
          color2: Colors.white.withOpacity(0.25), // Màu nhạt ở cuối
        ),
      ],
    );
  }
}
