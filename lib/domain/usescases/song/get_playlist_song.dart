import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/domain/repository/song.dart';
import 'package:musicapp_clone/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetPlaylistSongUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) {
    return sl<SongRepository>().getPlayListRepository();
  }
}