import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/domain/repository/song.dart';
import 'package:musicapp_clone/usecase/usecase.dart';
import '../../../service_locator.dart';

class SearchSongUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) {
    return sl<SongRepository>().searchSongs(params!);
  }
}