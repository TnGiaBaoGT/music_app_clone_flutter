import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';
import 'package:musicapp_clone/ui_components/fav_button.dart';

import '../../../assets/app_vectors.dart';
import '../music_screen.dart';

class TitleAndArtist extends StatelessWidget {
  const TitleAndArtist({
    super.key,
    required this.size,
    required this.widget,
    required this.songEntity,
  });

  final Size size;
  final MusicScreen widget;
  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.songEntity.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),),
                const SizedBox(height: 5),
                Text(widget.songEntity.artist,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),
          ),
          const Spacer(),
          FavButton(data: songEntity),
        ],
      ),
    );
  }
}
