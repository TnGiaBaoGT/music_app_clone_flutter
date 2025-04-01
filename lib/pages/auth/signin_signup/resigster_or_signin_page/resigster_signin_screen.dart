import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/auth/signin_signup/resigster_or_signin_page/ui_components/signin_register_button.dart';
import '../../../../ui_components/appbar_arrow.dart';


class ResigsterSigninScreen extends StatelessWidget {
  const ResigsterSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
            children: [
            const BaiscAppbar(),
              Column(
              children: [
                SizedBox(height: size.height * 0.3),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppVector.logo,
                    height: 71,),
                ),
                const SizedBox(height: 55),
                const Text('Enjoy Listening To Music',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),),
                const SizedBox(height: 21),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Text('PakoSic is a proprietary Swedish audio streaming and media services provider.',
                    style: TextStyle(
                      color: Color(0xffA0A0A0),
                      fontSize: 17,
                    ),),
                ),
                const SizedBox(height: 40),

                //SignIn Register Button-------------------------
                const SignInRegisterButton(),
              ],
            ),


          Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(AppVector.topPattern,
                  height: 180)),
          Positioned(
            bottom: 0,
              right: 0,
              child: IgnorePointer(
                child: SvgPicture.asset(AppVector.bottomPattern,
                height: 500,
                ),
              )),
        ],
        ),
    );
  }

}

