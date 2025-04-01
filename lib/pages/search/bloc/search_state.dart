import 'package:musicapp_clone/domain/entities/songs/song.dart';

abstract class SearchState{}

class SearchLoading extends SearchState{}

class SearchLoaded extends SearchState{
  final List<SongEntity> listSongSearched;
  SearchLoaded({
    required this.listSongSearched
});
}

class SearchError extends SearchState{}