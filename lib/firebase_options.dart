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
    apiKey: 'AIzaSyDFE2VU8smsUO66UcZ6JRR-QLZcOVchX1k',
    appId: '1:1065787546688:web:a9fe74c32c8131b14bd3a5',
    messagingSenderId: '1065787546688',
    projectId: 'portfolio-dd598',
    authDomain: 'portfolio-dd598.firebaseapp.com',
    storageBucket: 'portfolio-dd598.appspot.com',
    measurementId: 'G-V77JRJ3ZPL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz987WFmymjrf8AVIlfRMd0pdnBx6DrlI',
    appId: '1:1065787546688:android:2605102e646063574bd3a5',
    messagingSenderId: '1065787546688',
    projectId: 'portfolio-dd598',
    storageBucket: 'portfolio-dd598.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMBM2uDOPpuZyVHKSJivrlXkvRH0ILhC4',
    appId: '1:1065787546688:ios:dec8bbee636b20ac4bd3a5',
    messagingSenderId: '1065787546688',
    projectId: 'portfolio-dd598',
    storageBucket: 'portfolio-dd598.appspot.com',
    iosClientId:
        '1065787546688-m9u8rsfek7nba5cljsgud4j3di1jfgt2.apps.googleusercontent.com',
    iosBundleId: 'com.hmz.folio',
  );
}
