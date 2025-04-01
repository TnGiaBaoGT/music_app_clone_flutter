import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp_clone/app_config/theme/app_color.dart';
import 'package:musicapp_clone/assets/app_url_covers/app_url.dart';
import 'package:musicapp_clone/assets/app_vectors.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';
import 'package:musicapp_clone/pages/music/bloc/song_player_cubit.dart';
import 'package:musicapp_clone/pages/music/ui_components/buttons/custom_buttons.dart';
import 'package:musicapp_clone/pages/music/ui_components/buttons/custom_repeate_button.dart';
import 'package:musicapp_clone/pages/music/ui_components/title_and_artist.dart';
import '../../app_config/theme_checker.dart';
import '../../ui_components/appbar_arrow.dart';
import 'bloc/song_player_state.dart';

class MusicScreen extends StatefulWidget {
  final SongEntity songEntity;
  const MusicScreen({super.key,required this.songEntity});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
          create: (context) => SongPLayerCubit()..loadPlaySong(
              '${AppUrl.musicUrl}${widget.songEntity.title}.mp3?${AppUrl.format}'),
        child: Column(
          children: [
            //AppBar-------------------------------------------
            const BaiscAppbar(
              title: 'Now Playing',
              actions: [
                IconButton(
                  onPressed: null, // Không thể đặt const khi có onPressed, nếu cần active thì bỏ const này
                  icon: Icon(Icons.more_vert_sharp),
                ),
              ],
            ),

            //SongCovers---------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: size.height * 0.45,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                      '${AppUrl.firestorage}${widget.songEntity.artist} - ${widget.songEntity.title}.jpg?${AppUrl.format}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Title and artist--------------------------------
            TitleAndArtist(songEntity:widget.songEntity,size: size, widget: widget),

            //Processbar Play Pause---------------------------
            const SizedBox(height: 30),
            BlocBuilder<SongPLayerCubit,SongPlayerState>(
              builder: (context, state) {
              if(state is SongPLayerLoaded){
                return Column(
                children: [
                  Slider(
                    thumbColor: ThemeChecker.isDarkMode(context) ? const Color(0xffB7B7B7) : const Color(0xff434343),
                    activeColor: ThemeChecker.isDarkMode(context) ? const Color(0xffB7B7B7) : const Color(0xff434343),
                    value: context.read<SongPLayerCubit>().songPostion.inSeconds.toDouble(),
                    min: 0.0,
                    max: context.read<SongPLayerCubit>().songDuration.inSeconds.toDouble(),
                    onChanged: (value) {
                      context.read<SongPLayerCubit>().seek(value.toInt());
                    },
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                            formatDuration(context.read<SongPLayerCubit>().songPostion)
                        ),
                        const Spacer(),
                        Text(
                            formatDuration(context.read<SongPLayerCubit>().songDuration)
                        ),
                      ],
                    ),
                  ),


                  //PlayPause Button
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        CustomRepeateButtons(
                          svg: AppVector.repeate,
                          onTap: () {
                            context.read<SongPLayerCubit>().toggleRepeat();
                            print('repeate');
                          },
                        ),
                         const CustomButtons(
                          svg: AppVector.previous,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<SongPLayerCubit>().playOrPauseSong();
                          },
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              context.read<SongPLayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                        const CustomButtons(
                          svg: AppVector.next,
                        ),
                        const CustomButtons(
                          svg: AppVector.shuffle,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        )
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(
        2, '0')}';
  }
}



