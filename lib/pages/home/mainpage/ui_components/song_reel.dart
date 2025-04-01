import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';
import 'package:musicapp_clone/assets/app_url_covers/app_url.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/pages/home/mainpage/bloc/new_song/new_song_cubit.dart';
import 'package:musicapp_clone/pages/music/music_screen.dart';
import '../bloc/new_song/new_song_state.dart';


class SongReel extends StatelessWidget {
  const SongReel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewSongCubit()..getNewSongCubit(),
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: SizedBox(
          height: 240,
          child: BlocBuilder<NewSongCubit,NewSongState>(
              builder: (context, state) {
                print(state);
                if (state is NewSongLoading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is NewSongLoaded){
                 return buildListView(state);
                }
                return Container();
              },
          ),
        ),
      ),
    );
  }



  ListView buildListView(NewSongLoaded state) {
    return ListView.builder(
                 scrollDirection: Axis.horizontal,
                   itemCount: state.songs.length,
                   itemBuilder: (context, index) {
                    final dataSong = state.songs[index];
                     return Stack(
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder:
                             (context) => MusicScreen(songEntity: dataSong,)));
                           },
                           child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                               Container(
                                 margin: const EdgeInsets.only(right: 18),
                                 width: 150,
                                 height: 185,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(30),
                                   image: DecorationImage(
                                       image: NetworkImage(
                                         '${AppUrl.firestorage}${dataSong.artist} - ${dataSong.title}.jpg?${AppUrl.format}'
                                       ),
                                     fit: BoxFit.fill,
                                   ),
                                  )
                                 ),
                             const SizedBox(height: 13),
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: SizedBox(
                                 width: 120,
                                 height: 41,
                                 child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(dataSong.title,
                                       style: const TextStyle(
                                         overflow: TextOverflow.ellipsis,
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                       )
                                     ),
                                     Text(dataSong.artist,
                                         style: const TextStyle(
                                           overflow: TextOverflow.ellipsis,
                                           fontSize: 14,
                                           fontWeight: FontWeight.w500,
                                         )
                                     ),
                                   ]
                                 )),
                             ),
                           ],
                                                  ),
                         ),

                           Positioned(
                             bottom: 45,
                             right: 30,
                             child: GestureDetector(
                               onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder:
                                     (context) => MusicScreen(songEntity: state.songs[index],)));
                               },
                               child: Container(
                                 alignment: Alignment.center,
                                 height: 30,
                                 width: 30,
                                 decoration:  BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: ThemeChecker.isDarkMode(context) ? const Color(0xff2C2C2C) : const Color(0xffE6E6E6),
                                 ),
                                 child: SvgPicture.asset(AppVector.play,
                                   width: 13,
                                   colorFilter: ColorFilter.mode(ThemeChecker.isDarkMode(context) ? const Color(0xff959595) : const Color(0xff555555), BlendMode.srcIn),
                                 ),
                               ),
                             ),
                           ),
                     ]
                     );
                   },
               );
  }
}
