import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/usescases/song/get_new_song.dart';

import '../../../../../service_locator.dart';
import 'new_song_state.dart';

class NewSongCubit extends Cubit<NewSongState>{
  NewSongCubit() : super(NewSongLoading());

  Future<void> getNewSongCubit() async {
    var result = await sl<GetNewSongUseCase>().call();
    result.fold(
          (l) {
        emit(NewSongError(mess: 'Failed to get song'));
      },
          (r) {
        if (r == null || r.isEmpty) {
          emit(NewSongError(mess: 'No songs found.'));
        } else {
          emit(NewSongLoaded(songs: r));
        }
      },
    );
  }


}