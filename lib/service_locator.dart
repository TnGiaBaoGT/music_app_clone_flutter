import 'package:get_it/get_it.dart';
import 'package:musicapp_clone/data/repository/auth/auth_reposiory_impl.dart';
import 'package:musicapp_clone/data/repository/songs/song_repository_impl.dart';
import 'package:musicapp_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:musicapp_clone/data/sources/song/song_service.dart';
import 'package:musicapp_clone/domain/repository/auth.dart';
import 'package:musicapp_clone/domain/repository/song.dart';
import 'package:musicapp_clone/domain/usescases/auth/get_user.dart';
import 'package:musicapp_clone/domain/usescases/auth/sign_out.dart';
import 'package:musicapp_clone/domain/usescases/auth/signin.dart';
import 'package:musicapp_clone/domain/usescases/auth/signup.dart';
import 'package:musicapp_clone/domain/usescases/song/add_or_remove_favsong.dart';
import 'package:musicapp_clone/domain/usescases/song/get_new_song.dart';
import 'package:musicapp_clone/domain/usescases/song/get_playlist_song.dart';
import 'package:musicapp_clone/domain/usescases/song/get_user_favorite_songs.dart';
import 'package:musicapp_clone/domain/usescases/song/is_favsong.dart';
import 'package:musicapp_clone/domain/usescases/song/search_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  sl.registerSingleton<SongService>(
      SongServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongRepository>(
      SongRepositoryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );
  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );
  sl.registerSingleton<GetNewSongUseCase>(
      GetNewSongUseCase()
  );
  sl.registerSingleton<GetPlaylistSongUseCase>(
      GetPlaylistSongUseCase()
  );
  sl.registerSingleton<AddOrRemoveFavSong>(
      AddOrRemoveFavSong()
  );
  sl.registerSingleton<IsFavSong>(
      IsFavSong()
  );
  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );
  sl.registerSingleton<GetUserFavoriteSongsUseCase>(
      GetUserFavoriteSongsUseCase()
  );
  sl.registerSingleton<SignOutUseCase>(
      SignOutUseCase()
  );
  sl.registerSingleton<SearchSongUseCase>(
      SearchSongUseCase()
  );


}