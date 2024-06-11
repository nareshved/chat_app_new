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
        return windows;
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
    apiKey: 'AIzaSyDB8JPwsag4uAuAG09Y2VqEsiXF5q8Qdao',
    appId: '1:948860137355:web:3e97192179ff2b66d5898e',
    messagingSenderId: '948860137355',
    projectId: 'wachat-nk',
    authDomain: 'wachat-nk.firebaseapp.com',
    storageBucket: 'wachat-nk.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHmpVW4lcuEyqG4cQl118UX3nQISD_StE',
    appId: '1:948860137355:android:270136c66259a593d5898e',
    messagingSenderId: '948860137355',
    projectId: 'wachat-nk',
    storageBucket: 'wachat-nk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu6xZG1iDlkN1RwYV_pssX3SSplBtsCdQ',
    appId: '1:948860137355:ios:2835c03541176918d5898e',
    messagingSenderId: '948860137355',
    projectId: 'wachat-nk',
    storageBucket: 'wachat-nk.appspot.com',
    iosBundleId: 'com.example.chatAppNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAu6xZG1iDlkN1RwYV_pssX3SSplBtsCdQ',
    appId: '1:948860137355:ios:2835c03541176918d5898e',
    messagingSenderId: '948860137355',
    projectId: 'wachat-nk',
    storageBucket: 'wachat-nk.appspot.com',
    iosBundleId: 'com.example.chatAppNew',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDB8JPwsag4uAuAG09Y2VqEsiXF5q8Qdao',
    appId: '1:948860137355:web:3e97192179ff2b66d5898e',
    messagingSenderId: '948860137355',
    projectId: 'wachat-nk',
    authDomain: 'wachat-nk.firebaseapp.com',
    storageBucket: 'wachat-nk.appspot.com',
  );

}