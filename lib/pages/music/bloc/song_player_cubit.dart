import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp_clone/pages/music/bloc/song_player_state.dart';

class SongPLayerCubit extends Cubit<SongPlayerState>{

  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPostion = Duration.zero;
  bool isRepeat = false;

  SongPLayerCubit() : super(SongPLayerLoading()){

    audioPlayer.positionStream.listen((posittion){
      songPostion = posittion;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration){
      songDuration = duration!;
    });

    // Lắng nghe khi bài hát kết thúc
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (isRepeat) {
          audioPlayer.seek(Duration.zero); // Quay lại đầu bài hát
          audioPlayer.play();
        }
      }
    });
  }



  void updateSongPlayer(){
    emit(
      SongPLayerLoaded()
    );
  }

  Future<void> loadPlaySong(String url) async{
    try{
      await audioPlayer.setUrl(url);
      emit(SongPLayerLoaded());
    }
    catch(e){
      emit(SongPLayerError());
    }
  }
  void playOrPauseSong (){
    if(audioPlayer.playing){
      audioPlayer.stop();
    }
    else{
      audioPlayer.play();
    }
    emit(SongPLayerLoaded());
  }

  void seek(int seconds) {
    audioPlayer.seek(Duration(seconds: seconds));
  }
  void toggleRepeat() {
    isRepeat = !isRepeat;
    emit(SongPLayerLoaded()); // Cập nhật UI
  }


  @override
  Future<void> close() async {
    await audioPlayer.dispose(); // Chỉ hủy audioPlayer, không truy xuất context
    return super.close();
  }


}