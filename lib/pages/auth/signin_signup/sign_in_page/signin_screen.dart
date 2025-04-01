import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/app_config/theme/app_color.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/data/models/auth/signin_user.dart';
import 'package:musicapp_clone/domain/usescases/auth/signin.dart';
import 'package:musicapp_clone/pages/auth/signin_signup/sign_in_page/ui_components/google_signin.dart';
import 'package:musicapp_clone/pages/auth/signin_signup/sign_in_page/ui_components/recovery_password.dart';
import 'package:musicapp_clone/pages/auth/signin_signup/sign_in_page/ui_components/signin_divider.dart';
import 'package:musicapp_clone/ui_components/appbar_arrow.dart';
import 'package:musicapp_clone/ui_components/custom_button.dart';
import '../../../../service_locator.dart';
import '../../../home/mainpage/home_screen.dart';
import '../register_page/register_screen.dart';
import '../ui_components/custom_textfield.dart';
import '../ui_components/custom_textfield_icon.dart';
import '../ui_components/signin_register_shortcut.dart';
import '../ui_components/support_text.dart';


class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});


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
                    SizedBox(height: size.height * 0.18),
                    const Text('Sign In',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 22),
                    const SupportText(),
        
                    //Email-----------------------------------------
                    const SizedBox(height: 28),
                    CustomTextField(
                      controller: email,
                      hintText: 'Enter Username Or Email',
                    ),
        
                    //Password--------------------------------------
                    const SizedBox(height: 16),
                    CustomTextfieldIcon(
                      controller: pass,
                      hintText: 'Password',
                    ),
        
                    //Recovery Password-----------------------------
                    const SizedBox(height: 20),
                    const RecoveryPassword(),
        
                    //Button SignIn---------------------------------
                    const SizedBox(height: 22),
                    CustomButton(
                      text: 'Sign In',
                      onPressed: () async{
                        var result = await sl<SigninUseCase>().call(
                            params: SignInUser(
                                email: email.text.toString(),
                                pass: pass.text.toString()
                            )
                        );
                        result.fold(
                                (l){
                              var snackBar = SnackBar(
                                backgroundColor: AppColors.primary,
                                  content: Text(l),
                                  behavior: SnackBarBehavior.floating);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                                (r){
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                                      (route) => false);
                            }
                        );
                      },
                    ),
        
                    //Divider---------------------------------------
                    const SizedBox(height: 31),
                    const SignInDivider(),
        
                    //Google----------------------------------------
                    const SizedBox(height: 45),
                    const GoogleSignIn(),
        
                    //Register Shortcut-----------------------------
                    const SizedBox(height: 45),
                    SignInRegisterShortcut(
                      text1: 'Not A Member ? ',
                      text2: 'Register Now',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => RegisterScreen()));
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







