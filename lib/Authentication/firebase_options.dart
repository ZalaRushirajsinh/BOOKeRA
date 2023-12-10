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
    apiKey: 'AIzaSyD_N33niZkcbJnCFnRTVdm90SWx126_Nzo',
    appId: '1:322139946282:web:97aac00bcaccac3f61f253',
    messagingSenderId: '322139946282',
    projectId: 'bookera-90538',
    authDomain: 'bookera-90538.firebaseapp.com',
    storageBucket: 'bookera-90538.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8-Twbabh9hgRm9UFp9N5yI0cDOTv1Dmc',
    appId: '1:322139946282:android:3f9971930a82b66061f253',
    messagingSenderId: '322139946282',
    projectId: 'bookera-90538',
    storageBucket: 'bookera-90538.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqLN601VE8X3JBd3FKln6KQz4hnr7qyLc',
    appId: '1:322139946282:ios:b1b7ade2fda2233261f253',
    messagingSenderId: '322139946282',
    projectId: 'bookera-90538',
    storageBucket: 'bookera-90538.appspot.com',
    iosBundleId: 'com.example.splitedCode',
  );
}