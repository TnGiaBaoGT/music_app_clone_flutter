import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';

class SongModel {
   String ? title;
   String ? artist;
   num ? duration;
   Timestamp ? releaseDate;
   bool ? isFav;
   String ? songId;

   SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
     required this.isFav,
     required this.songId,
  });

  SongModel.fromJson(Map<String,dynamic> json) {
   title = json['title'];
   artist = json['artist'];
   duration = json['duration'];
   releaseDate = json['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        isFav: isFav!,
        songId: songId!,
    );
  }
}
