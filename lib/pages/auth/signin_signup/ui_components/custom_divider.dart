import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color1;
  final Color color2;
  const CustomDivider({
    super.key,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1, // Độ dày của đường kẻ
      width: 150, // Chiều rộng full màn hình
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
