import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';
import 'package:musicapp_clone/domain/usescases/song/get_user_favorite_songs.dart';
import 'package:musicapp_clone/pages/profile/bloc/favorite_songs_state.dart';

import '../../../service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState>{
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> listSong = [];
  Future<void> getFavoriteSongs() async{
    var result = await sl<GetUserFavoriteSongsUseCase>().call();

    result.fold(
        (l){
          emit(FavoriteSongsError());
        },
        (r){
          listSong = r;
          emit(FavoriteSongsLoaded(songEntity: listSong));
        }
    );
  }

  void removeSong(index) {
    listSong.removeAt(index);
    emit(FavoriteSongsLoaded(songEntity: listSong));
  }
}