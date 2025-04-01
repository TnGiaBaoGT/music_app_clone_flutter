import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_images.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import '../../../ui_components/custom_button.dart';
import '../choose_mode_page/choose_mode_screen.dart';


class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.introBg),
              fit: BoxFit.fitWidth),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVector.logo)),
                const Spacer(),
                const Text(
                    'Enjoy listening to music',
                     style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 21),
                SizedBox(
                  width: size.width * 0.7,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    style: TextStyle(
                      color: Color(0xff797979),
                      fontSize: 17))),

                const SizedBox(height: 37),
                CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    (context) => const ChooseModeScreen()));
                  },
                  height: 90,
                ),
              ],
            ),
          ),


          //Lower the brightness
            IgnorePointer(
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          

        ],
      ),
    );
  }
}


