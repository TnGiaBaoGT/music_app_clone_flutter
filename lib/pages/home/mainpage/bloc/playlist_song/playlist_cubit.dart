import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/usescases/song/get_playlist_song.dart';
import 'package:musicapp_clone/pages/home/mainpage/bloc/playlist_song/playlist_state.dart';
import '../../../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState>{
  PlayListCubit() : super(PlayListLoaing());

  Future<void> getPlayListSongs() async {
    var result = await sl<GetPlaylistSongUseCase>().call();
    result.fold(
          (l) {
        emit(PlayListError(mess: 'Failed to get song'));
      },
          (r) {
        if (r == null || r.isEmpty) {
          emit(PlayListError(mess: 'No songs found.'));
        } else {
          emit(PlayListLoaded(playlistsong: r));
        }
      },
    );
  }
}