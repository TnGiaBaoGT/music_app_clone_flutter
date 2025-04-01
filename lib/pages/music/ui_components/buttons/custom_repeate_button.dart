import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/song_player_cubit.dart';

class CustomRepeateButtons extends StatelessWidget {
  final String svg;
  final Function()? onTap;
  final Color? color; // Thêm tham số màu

  const CustomRepeateButtons({
    super.key,
    required this.svg,
    this.onTap,
    this.color, // Nhận màu từ bên ngoài
  });

  @override
  Widget build(BuildContext context) {
    final isRepeat = context.watch<SongPLayerCubit>().isRepeat;
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        svg,
        color: isRepeat ? Colors.blue : Colors.grey, // Nếu không truyền màu, mặc định là xám
      ),
    );
  }
}