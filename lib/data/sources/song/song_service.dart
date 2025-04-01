import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musicapp_clone/data/models/song/song.dart';
import 'package:musicapp_clone/domain/entities/songs/song.dart';
import 'package:musicapp_clone/domain/usescases/song/is_favsong.dart';

import '../../../service_locator.dart';

abstract class SongService{
  Future<Either> getNewSong();
  Future<Either> getPlayListSong();
  Future<Either> addOrRemoveFavSongs(String songId);
  Future<bool> isFavSng(String songId);
  Future<Either> getUserFavoriteSongs();
  Future<Either> searchSongs(String keyword);
}

class SongServiceImpl extends SongService {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either> getNewSong() async{
    try{
    List<SongEntity> songs = [];
   var data = await firebaseFirestore.collection('songs')
       .orderBy('releaseDate',descending: true)
       .limit(3)
       .get();
   for (var e in data.docs){
     var songModel = SongModel.fromJson(e.data());
     bool isFavorite = await sl<IsFavSong>().call(
       params: e.reference.id
     );
     songModel.isFav = isFavorite;
     songModel.songId = e.reference.id;
     songs.add(
       songModel.toEntity()
     );
   }
   return Right(songs);
  }
  catch (e){
      return Left('Failed to get song: $e');
    }
  }

  @override
  Future<Either> getPlayListSong() async{
    try{
      List<SongEntity> playlistsongs = [];
      var data = await firebaseFirestore.collection('songs')
          .orderBy('releaseDate',descending: false)
          .get();
      for (var e in data.docs){
        var songModel = SongModel.fromJson(e.data());
        bool isFavorite = await sl<IsFavSong>().call(
            params: e.reference.id
        );
        songModel.isFav = isFavorite;
        songModel.songId = e.reference.id;
        playlistsongs.add(
            songModel.toEntity()
        );
      }
      return Right(playlistsongs);
    }
    catch (e){
      return Left('Failed to get songs: $e');
    }
  }

  @override
  Future<Either> addOrRemoveFavSongs(String songId) async{
    try {
      late bool isFav;
      var dataUser = await firebaseAuth.currentUser;
      String uId = dataUser!.uid;
      QuerySnapshot favSongs = await firebaseFirestore.collection('user')
          .doc(uId)
          .collection('favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if(favSongs.docs.isNotEmpty){
        await favSongs.docs.first.reference.delete();
        isFav = false;
      }
      else{
        await firebaseFirestore.collection('user')
            .doc(uId)
            .collection('favorites')
            .add({
          'songId' : songId,
          'addDate': Timestamp.now(),
        });
        isFav = true;
      }
      return Right(isFav);
    }
    catch(e){
     return const Left('Failed action');
    }
  }

  @override
  Future<bool> isFavSng(String songId) async{
    try {
      var dataUser = await firebaseAuth.currentUser;
      String uId = dataUser!.uid;
      QuerySnapshot favSongs = await firebaseFirestore.collection('user')
          .doc(uId)
          .collection('favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if(favSongs.docs.isNotEmpty){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async{
    try {
      var dataUser = await firebaseAuth.currentUser;
      List<SongEntity> favSong = [];
      String uId = dataUser!.uid;
      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('user')
          .doc(uId).collection('favorites')
          .get();

      for (var element in favoriteSongs.docs) {
        String songId = element['songId'];
        var song = await firebaseFirestore.collection('songs').doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.isFav = true;
        songModel.songId = songId;
        favSong.add(
          songModel.toEntity()
        );
      }
      return Right(favSong);
    }
    catch(e){
      return const Left('Failed to get favorite songs.');
    }
  }

  Future<Either> searchSongs(String keyword) async {
    try {
      List<SongEntity> searchResults = [];

      // Lấy danh sách bài hát yêu thích trước
      var dataUser = await firebaseAuth.currentUser;
      String uId = dataUser!.uid;
      QuerySnapshot favoriteSongsSnapshot = await firebaseFirestore
          .collection('user')
          .doc(uId)
          .collection('favorites')
          .get();

      Set<String> favoriteSongIds = favoriteSongsSnapshot.docs
          .map((doc) => doc['songId'] as String)
          .toSet(); // Chuyển danh sách sang Set để tìm kiếm nhanh hơn


      // Tìm kiếm bài hát trong Firestore
      final querySnapshot = await firebaseFirestore
          .collection('songs')
          .orderBy('title')
          .startAt([keyword.toUpperCase()])
          .endAt(["${keyword.toUpperCase()}\uf8ff"])
          .get();

      print("🔍 Firestore trả về: ${querySnapshot.docs.length} kết quả"); // Log kiểm tra

      for (var song in querySnapshot.docs) {
        SongModel songModel = SongModel.fromJson(song.data());
        songModel.songId = song.id; // Lấy ID từ Firestore nếu cần
        songModel.isFav = favoriteSongIds.contains(song.id); // Kiểm tra nếu bài hát đã được yêu thích
        searchResults.add(songModel.toEntity()); // Chuyển sang SongEntity
      }

      print("✅ Tìm thấy bài hát: ${searchResults.length} bài");

      return Right(searchResults);
    } catch (e) {
      print("❌ Error fetching songs: $e");
      return const Left('Failed to find songs.');
    }
  }




}