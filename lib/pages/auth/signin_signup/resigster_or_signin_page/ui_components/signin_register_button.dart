import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';

import '../../../../../ui_components/custom_button.dart';
import '../../register_page/register_screen.dart';
import '../../sign_in_page/signin_screen.dart';



class SignInRegisterButton extends StatelessWidget {
  const SignInRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: CustomButton(
              height: 70,
              text: 'Register',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                (context) => RegisterScreen()));
              },
            ),
          ),
          const SizedBox(width: 50),
          TextButton(
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder:
                (context) =>  SigninScreen()));
              } ,
              child: Text('Sign In',
                style: TextStyle(
                  color: ThemeChecker.isDarkMode(context) ? const Color(0xffD7D7D7) : const Color(0xff313131),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),))
        ],
      ),
    );
  }
}
