import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';


class SupportText extends StatelessWidget {
  const SupportText({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'If You Need Any Support ',
              style: TextStyle(
                color: ThemeChecker.isDarkMode(context) ? Colors.white : const Color(0xff383838),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              )
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
                'Cick Here',
                style: TextStyle(
                  color: Color(0xff42C83C),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
        ]
    );
  }
}
