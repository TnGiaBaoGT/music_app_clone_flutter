import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/assets/app_url_covers/app_url.dart';
import 'package:musicapp_clone/pages/music/music_screen.dart';
import 'package:musicapp_clone/pages/profile/bloc/favorite_songs_cubit.dart';
import 'package:musicapp_clone/pages/profile/bloc/favorite_songs_state.dart';
import 'package:musicapp_clone/ui_components/fav_button.dart';

class FavoriteSongsList extends StatelessWidget {
  const FavoriteSongsList({
    super.key,
  });

  String formatDuration(double duration) {
    int minutes = duration.floor(); // Lấy phần nguyên làm phút
    int seconds = ((duration - minutes) * 100).round(); // Giữ nguyên phần thập phân làm giây

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('FAVORITE SONGS',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            BlocBuilder<FavoriteSongsCubit,FavoriteSongsState>(
                builder: (context, state) {
                  print(state);
                  if(state is FavoriteSongsLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is FavoriteSongsLoaded){
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: state.songEntity.length,
                          itemBuilder: (context, index) {
                          final dataSong = state.songEntity[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                (context) => MusicScreen(songEntity: dataSong)));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            '${AppUrl.firestorage}${dataSong.artist} - ${dataSong.title}.jpg?${AppUrl.format}'
                                          )),
                                    ),
                                  ),

                                  //Title and Artist--------------------------------
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(dataSong.title,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),),
                                        const SizedBox(height: 10),
                                        Text(dataSong.artist,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),),
                                      ],
                                    ),
                                  ),

                                  //Duration----------------------------------------
                                  const SizedBox(width: 50),
                                  Text(
                                    formatDuration(dataSong.duration.toDouble()),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  FavButton(
                                      key: UniqueKey(),
                                      data: dataSong,
                                      function: (){
                                        print('pressed');
                                        context.read<FavoriteSongsCubit>().removeSong(index);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                          },
                    );
                  }
                  if(state is FavoriteSongsError){
                    print('error');
                  }
                  return Container();
                },

            ),
          ],
        ),
      ),
    );
  }

}