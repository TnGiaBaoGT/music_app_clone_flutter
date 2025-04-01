import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/usescases/song/search_song.dart';
import 'package:musicapp_clone/pages/search/bloc/search_state.dart';
import '../../../domain/entities/songs/song.dart';
import '../../../service_locator.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchLoading());

  List<SongEntity> searchSong = [];
  Future<void> searchSongs(String keyword) async{
    var result = await sl<SearchSongUseCase>().call(
      params: keyword
    );
    result.fold(
        (l){
          emit(SearchError());
        },
        (r){
          searchSong = r;
          emit(SearchLoaded(listSongSearched: searchSong));
        }
    );
  }
}