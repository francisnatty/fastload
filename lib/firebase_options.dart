// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDIJvXBzLZLhKSgtVxKSh797ifT83DIhkU',
    appId: '1:906557285628:web:aa5fb1c7d286d76ec06379',
    messagingSenderId: '906557285628',
    projectId: 'fast-loadd',
    authDomain: 'fast-loadd.firebaseapp.com',
    storageBucket: 'fast-loadd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt3eOw-Jpn7T4T8aLGdnkUfnCM7cdabNA',
    appId: '1:906557285628:android:03a1cbd57c5c19a5c06379',
    messagingSenderId: '906557285628',
    projectId: 'fast-loadd',
    storageBucket: 'fast-loadd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPrgOtvSEhXr2PiEv5dzh9z75SNjZ2K48',
    appId: '1:906557285628:ios:e17d29424a7240fcc06379',
    messagingSenderId: '906557285628',
    projectId: 'fast-loadd',
    storageBucket: 'fast-loadd.appspot.com',
    iosBundleId: 'com.example.fastload',
  );
}
