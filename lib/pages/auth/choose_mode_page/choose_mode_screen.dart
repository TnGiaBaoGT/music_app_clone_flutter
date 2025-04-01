import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_images.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/auth/choose_mode_page/ui_components/choose_mode_circle.dart';
import 'package:musicapp_clone/ui_components/custom_button.dart';
import '../signin_signup/resigster_or_signin_page/resigster_signin_screen.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVector.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
                const ChooseModeSection(),
                const SizedBox(height: 70),
                CustomButton(
                  height: 90,
                    text: 'Continue',
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context) => const ResigsterSigninScreen()));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
