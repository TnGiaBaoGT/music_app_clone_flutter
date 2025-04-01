import 'package:dartz/dartz.dart';

abstract class SongRepository {

  Future<Either> getNewSongRepository();
  Future<Either> getPlayListRepository();
  Future<Either> addOrRemoveFavoriteSongs(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
  Future<Either> searchSongs(String keyword);
}