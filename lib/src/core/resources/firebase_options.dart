
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
        return macos;
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
    apiKey: 'AIzaSyCTX7RcaHMueJdryXNQHqbFsKrftteXW4c',
    appId: '1:489842974591:web:7feb34b04b9bed7292044a',
    messagingSenderId: '489842974591',
    projectId: 'gssapp-4be9a',
    authDomain: 'gssapp-4be9a.firebaseapp.com',
    storageBucket: 'gssapp-4be9a.appspot.com',
    measurementId: 'G-377M9PR1G4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKqSstq3asxKhu4Sa6HLUW3T9Mw6WlpCY',
    appId: '1:489842974591:android:4ef0dc3f63340fa792044a',
    messagingSenderId: '489842974591',
    projectId: 'gssapp-4be9a',
    storageBucket: 'gssapp-4be9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9VDXSfrQ7AScN9XNAl5GwQ3BdC2YjiBI',
    appId: '1:489842974591:ios:e81c04d39719f82992044a',
    messagingSenderId: '489842974591',
    projectId: 'gssapp-4be9a',
    storageBucket: 'gssapp-4be9a.appspot.com',
    iosBundleId: 'com.example.gss',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9VDXSfrQ7AScN9XNAl5GwQ3BdC2YjiBI',
    appId: '1:489842974591:ios:213c0ab66de8d26692044a',
    messagingSenderId: '489842974591',
    projectId: 'gssapp-4be9a',
    storageBucket: 'gssapp-4be9a.appspot.com',
    iosBundleId: 'com.example.gss.RunnerTests',
  );
}
