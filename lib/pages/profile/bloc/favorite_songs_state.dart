import 'package:musicapp_clone/domain/entities/songs/song.dart';

abstract class FavoriteSongsState{}

class FavoriteSongsLoading extends FavoriteSongsState{}

class FavoriteSongsLoaded extends FavoriteSongsState{
  final List<SongEntity> songEntity;
  FavoriteSongsLoaded({
    required this.songEntity,
});
}

class FavoriteSongsError extends FavoriteSongsState{}
