import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/home/mainpage/ui_components/playlist.dart';
import 'package:musicapp_clone/pages/home/mainpage/ui_components/song_reel.dart';
import 'package:musicapp_clone/pages/home/mainpage/ui_components/tab_reel.dart';
import 'package:musicapp_clone/pages/home/mainpage/ui_components/top_header_banner.dart';
import 'package:musicapp_clone/pages/profile/profile_screen.dart';
import 'package:musicapp_clone/pages/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: buildAppBar(context),
          body: const SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Header new album--------------------------
                  TopHeaderBanner(),

                  //Tab Reel----------------------------------
                  SizedBox(height: 40),
                  TabReel(),

                  //Song Reel
                  SizedBox(height: 20),
                  SongReel(),

                  //PlayList----------------------------------
                  SizedBox(height: 35),
                  Playlist(),
                ],
              ),
            ),
          ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
          title: SvgPicture.asset(AppVector.logo,
              height: 35),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                (context) => const SearchPage()));
              },
              icon: SvgPicture.asset(AppVector.search)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder:
                      (context) => const ProfileScreen()));
                },
                icon: const Icon(Icons.more_vert)),
          ],
        );
  }







}

