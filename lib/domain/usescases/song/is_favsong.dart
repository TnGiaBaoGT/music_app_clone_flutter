import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/domain/repository/song.dart';
import 'package:musicapp_clone/usecase/usecase.dart';
import '../../../service_locator.dart';

class IsFavSong implements UseCase<bool,String> {
  @override
  Future<bool> call({String ? params}) async{
    return await sl<SongRepository>().isFavoriteSong(params!);
  }
}