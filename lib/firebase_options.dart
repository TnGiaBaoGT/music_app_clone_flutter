// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAaqhe-6bJ-SoHO5h31kujjjtLEBYtBmco',
    appId: '1:355578281829:web:ca2f7d6b295ae228b42b8c',
    messagingSenderId: '355578281829',
    projectId: 'instarelica',
    authDomain: 'instarelica.firebaseapp.com',
    storageBucket: 'instarelica.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD-EXgj61uA_o8-MYXIOGSdVHtwR6bLc4',
    appId: '1:355578281829:android:074158ea120b69dbb42b8c',
    messagingSenderId: '355578281829',
    projectId: 'instarelica',
    storageBucket: 'instarelica.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHTAfNmR823gRQ52XyenrwfIcUaB3AACA',
    appId: '1:355578281829:ios:8146e74e981435a8b42b8c',
    messagingSenderId: '355578281829',
    projectId: 'instarelica',
    storageBucket: 'instarelica.appspot.com',
    iosBundleId: 'com.example.musicappClone',
  );
}
