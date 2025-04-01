import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:musicapp_clone/app_config/theme/app_theme.dart';
import 'package:musicapp_clone/firebase_options.dart';
import 'package:musicapp_clone/pages/auth/choose_mode_page/bloc/theme_cubit.dart';
import 'package:musicapp_clone/pages/auth/splash_page/splash_screen.dart';
import 'package:musicapp_clone/pages/home/mainpage/home_screen.dart';
import 'package:musicapp_clone/pages/music/bloc/song_player_cubit.dart';
import 'package:musicapp_clone/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => SongPLayerCubit())
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PakoSic',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

