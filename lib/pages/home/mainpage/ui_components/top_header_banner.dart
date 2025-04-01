import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import '../../../../assets/app_images.dart';

class TopHeaderBanner extends StatelessWidget {
  const TopHeaderBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVector.hometopcard)),
          Positioned(
              right: 60,
              bottom: -1,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(AppImages.homeArtist))),
        ],
      ),
    );
  }
}
