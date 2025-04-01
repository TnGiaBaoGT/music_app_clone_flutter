import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app_config/theme/app_color.dart';
import '../../../../assets/app_vectors.dart';
import '../bloc/theme_cubit.dart';

class ChooseModeCircle extends StatelessWidget {
  final String title;
  final String svg;
  final Function()? onTap;
  final bool isSelected;
  const ChooseModeCircle({
    super.key,
    required this.title,
    required this.svg,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(bottom: 17,top: 32),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.5) : AppColors.darkGrey.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svg),
          ),
        ),
        Text(title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),)
      ],
    );
  }
}

class ChooseModeSection extends StatelessWidget {
  const ChooseModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeMode>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChooseModeCircle(
              onTap: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              },
              isSelected: state == ThemeMode.dark,
              title: 'Dark Mode',
              svg: AppVector.moon,
            ),
            const SizedBox(width: 80),
            ChooseModeCircle(
              onTap: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.light);
              },
              isSelected: state == ThemeMode.light,
              title: 'Light Mode',
              svg: AppVector.sun,
            ),
          ],
        );
      }
    );
  }
}

