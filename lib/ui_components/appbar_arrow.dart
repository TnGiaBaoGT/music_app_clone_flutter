import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';


class BaiscAppbar extends StatelessWidget {
  final String ? title;
  final bool centerTitle;
  final List<Widget>? actions;
  const BaiscAppbar({super.key,this.title,this.centerTitle = true,this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      title: title != null && title!.isNotEmpty
          ? Text(title!,style: const TextStyle(
        fontWeight: FontWeight.w700))
          : const SizedBox.shrink(),
      actions: actions,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: ThemeChecker.isDarkMode(context) ? Colors.white.withOpacity(0.03) : const Color(0xff000000).withOpacity(0.06),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: ThemeChecker.isDarkMode(context) ? const Color(0xffDDDDDD) : const Color(0xff414141),
          ),
        ),
      ),
    );
  }


}
