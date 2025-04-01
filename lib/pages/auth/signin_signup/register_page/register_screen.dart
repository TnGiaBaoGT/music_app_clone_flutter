import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/data/models/auth/create_user.dart';
import 'package:musicapp_clone/domain/usescases/auth/signup.dart';
import 'package:musicapp_clone/pages/home/mainpage/home_screen.dart';
import 'package:musicapp_clone/ui_components/custom_button.dart';
import '../../../../service_locator.dart';
import '../../../../ui_components/appbar_arrow.dart';
import '../sign_in_page/signin_screen.dart';
import '../sign_in_page/ui_components/google_signin.dart';
import '../sign_in_page/ui_components/signin_divider.dart';
import '../ui_components/custom_textfield.dart';
import '../ui_components/custom_textfield_icon.dart';
import '../ui_components/signin_register_shortcut.dart';
import '../ui_components/support_text.dart';





class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children: [
            const BaiscAppbar(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    SizedBox(height: size.height *0.15),
                    const Text('Register',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        )),
        
                    //Support Text--------------------------------
                    const SizedBox(height: 15),
                    const SupportText(),
        
                    //Infos User----------------------------------
                    const SizedBox(height: 26),
                    CustomTextField(
                      controller: fullName,
                      hintText: 'Full Name',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: email,
                      hintText: 'Enter Email',
                    ),
                    const SizedBox(height: 16),
                     CustomTextfieldIcon(
                       controller: pass,
                       hintText: 'Password',
                    ),
        
                    //Create Account Button-----------------------
                    const SizedBox(height: 33),
                    CustomButton(
                        text: 'Create Account',
                        onPressed: () async{
                          var result = await sl<SignupUseCase>().call(
                            params: CreateUser(
                                fullName: fullName.text.toString(),
                                email: email.text.toString(),
                                password: pass.text.toString()
                            )
                          );
                          result.fold(
                            (l){
                              var snackBar = SnackBar(content: Text(l),behavior: SnackBarBehavior.floating);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                                  (r){
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                              (route) => false);
                                  }
                          );
                        },
                    ),
        
                    //Divider-------------------------------------
                    const SizedBox(height: 40),
                    const SignInDivider(),
        
                    //Google SignIn-------------------------------
                    const SizedBox(height: 40),
                    const GoogleSignIn(),
        
                    //SignIn Shortcut-----------------------------
                    const SizedBox(height: 32),
                    SignInRegisterShortcut(
                      text1: 'Do You Have An Account ? ',
                      text2: 'Sign In',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context) =>  SigninScreen(),));
                      },
                    ),
        
                  ],
                ),
              ),
            ),
          Positioned(
              top: size.height * 0.06,
              right: 0,
              left: 0,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVector.logo,height: 35,))),
        ],
        ),
      ),
    );
  }
}
