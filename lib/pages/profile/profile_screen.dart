import 'package:flutter/material.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';
import 'package:musicapp_clone/domain/usescases/auth/sign_out.dart';
import 'package:musicapp_clone/pages/auth/splash_page/splash_screen.dart';
import 'package:musicapp_clone/pages/profile/ui_components/favorite_song.dart';
import 'package:musicapp_clone/pages/profile/ui_components/profile_user.dart';
import 'package:musicapp_clone/ui_components/appbar_arrow.dart';

import '../../service_locator.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
            body: Stack(
              children:[
                Column(
                children: [
                  Container(
                    width: size.width * 1,
                    height: size.height * 0.35,
                    decoration: BoxDecoration(
                      color: ThemeChecker.isDarkMode(context) ? const Color(0xff343434) : Colors.grey.withOpacity(0.12),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                    ),
                    child: const ProfileUser(),
                  ),
                  const SizedBox(height: 15),
                  const FavoriteSongsList(),
                ],
              ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: BaiscAppbar(
                    title: 'Profile',
                    actions: [
                      IconButton(
                          onPressed: () async{
                            await sl<SignOutUseCase>().call();
                            if(!context.mounted) return;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                            (context) => const SplashScreen()));
                          },
                          icon: const Icon(Icons.logout)
                      ),
                    ],
                  ),
                ),
              ],
            ),

    );
  }
}


