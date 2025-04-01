import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/home/mainpage/bloc/playlist_song/playlist_cubit.dart';
import 'package:musicapp_clone/pages/home/mainpage/bloc/playlist_song/playlist_state.dart';

import '../../../../app_config/theme_checker.dart';
import '../../../../ui_components/fav_button.dart';
import '../../../music/music_screen.dart';


class Playlist extends StatelessWidget {
  const Playlist({super.key});

  String formatDuration(double duration) {
    int minutes = duration.floor(); // Lấy phần nguyên làm phút
    int seconds = ((duration - minutes) * 100).round(); // Giữ nguyên phần thập phân làm giây

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PlayListCubit()..getPlayListSongs(),
      child: BlocBuilder<PlayListCubit,PlayListState>(
          builder: (context, state) {
            print(state);
            if(state is PlayListLoaded){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    //Header-------------------------------------
                    const Row(
                      children: [
                        Text('Playlist',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Text('See More',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffC6C6C6)),),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),
                    //PlayList Reel
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: state.playlistsong.length,
                        itemBuilder: (context, index) {
                          final data = state.playlistsong[index];
                          //print(state.playlistsong.length);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context) =>  MusicScreen(songEntity: state.playlistsong[index],)));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ThemeChecker.isDarkMode(context) ? const Color(0xff2C2C2C) : const Color(0xffE6E6E6),
                                      ),
                                      child: SvgPicture.asset(AppVector.play,
                                        colorFilter: ColorFilter.mode(ThemeChecker.isDarkMode(context) ? const Color(0xff959595) : const Color(0xff555555), BlendMode.srcIn),
                                        fit: BoxFit.none,
                                      )
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 130,
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${data.title}\n',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                          )
                                        ),
                                        Text(data.artist,
                                          style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,height: 1.8)
                                        ),
                                      ]
                                    )),

                                  //Duration---------------------------------------
                                  const SizedBox(width: 40),
                                  Text(formatDuration(data.duration.toDouble())),

                                  //Like Button------------------------------------
                                  const Spacer(),
                                  FavButton(data: data),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              );
            }
            return Container();
          },
      ),
    );
  }
}

