import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../assets/app_vectors.dart';


class GoogleSignIn extends StatelessWidget {
  final Function()? onTap;
  const GoogleSignIn({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        child: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(AppVector.google)),
      ),
    );
  }
}
