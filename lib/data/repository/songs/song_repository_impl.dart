import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/data/sources/song/song_service.dart';
import '../../../domain/repository/song.dart';
import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongRepository() async {
    return await sl<SongService>().getNewSong();
  }

  @override
  Future<Either> getPlayListRepository() async{
    return await sl<SongService>().getPlayListSong();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongService>().addOrRemoveFavSongs(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongService>().isFavSng(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async{
    return await sl<SongService>().getUserFavoriteSongs();
  }

  @override
  Future<Either> searchSongs(String keyword) async {
   return await sl<SongService>().searchSongs(keyword);
  }
}