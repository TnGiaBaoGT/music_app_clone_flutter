
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/usescases/song/add_or_remove_favsong.dart';
import 'package:musicapp_clone/pages/home/bloc_fav/fav_state.dart';

import '../../../service_locator.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  void favUpdated(String songId) async{
    var result = await sl<AddOrRemoveFavSong>().call(
      params: songId
    );
    result.fold(
        (l){},
        (r){
          emit(FavUpdated(isFav: r));
        }
    );
  }
}