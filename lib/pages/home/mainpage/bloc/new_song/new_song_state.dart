import '../../../../../domain/entities/songs/song.dart';

abstract class NewSongState {}
  //Initial
  class NewSongInitial extends NewSongState{}

  //Loading
  class NewSongLoading extends NewSongState{}

  //Loaded
  class NewSongLoaded extends NewSongState{
  final List<SongEntity> songs;
  NewSongLoaded({
    required this.songs,
  });
  }

  //Error
  class NewSongError extends NewSongState{
  final String mess;
  NewSongError({
    required this.mess,
  });
  }