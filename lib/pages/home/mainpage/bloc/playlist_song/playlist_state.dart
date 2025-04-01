import 'package:musicapp_clone/domain/entities/songs/song.dart';

abstract class PlayListState {}

//initial
class PlayListInitial extends PlayListState{}

//loading
class PlayListLoaing extends PlayListState{}

//loaded
class PlayListLoaded extends PlayListState{
  final List<SongEntity> playlistsong ;
  PlayListLoaded({
    required this.playlistsong
});
}

//error
class PlayListError extends PlayListState{
  final String mess;
  PlayListError({
    required this.mess
});
}
