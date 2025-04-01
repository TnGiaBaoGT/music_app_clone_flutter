import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/song_player_cubit.dart';

class CustomButtons extends StatelessWidget {
  final String svg;
  final Function()? onTap;
  final Color? color; // Thêm tham số màu

  const CustomButtons({
    super.key,
    required this.svg,
    this.onTap,
    this.color, // Nhận màu từ bên ngoài
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        svg,
        // Nếu không truyền màu, mặc định là xám
      ),
    );
  }
}