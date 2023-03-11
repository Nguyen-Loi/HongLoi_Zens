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
    apiKey: 'AIzaSyCWxZxCTtRy3px1SwIKWc1kKqWzpHi0mo8',
    appId: '1:168912674045:web:c5c73a0af8363420adb294',
    messagingSenderId: '168912674045',
    projectId: 'chatexample-cda5f',
    authDomain: 'chatexample-cda5f.firebaseapp.com',
    databaseURL: 'https://chatexample-cda5f-default-rtdb.firebaseio.com',
    storageBucket: 'chatexample-cda5f.appspot.com',
    measurementId: 'G-L62VSTW12Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXHjuQZdlYXQVF4Ajqrx1jOLK0IijzWN0',
    appId: '1:168912674045:android:a3310d4f92924b3cadb294',
    messagingSenderId: '168912674045',
    projectId: 'chatexample-cda5f',
    databaseURL: 'https://chatexample-cda5f-default-rtdb.firebaseio.com',
    storageBucket: 'chatexample-cda5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCru2eDBH6vY2bSGijpnHY-nNSGKHLJmM',
    appId: '1:168912674045:ios:c16c75a8ba8bb181adb294',
    messagingSenderId: '168912674045',
    projectId: 'chatexample-cda5f',
    databaseURL: 'https://chatexample-cda5f-default-rtdb.firebaseio.com',
    storageBucket: 'chatexample-cda5f.appspot.com',
    iosClientId: '168912674045-mqsniu4a5jh11ku948ib2jjeu04njrd8.apps.googleusercontent.com',
    iosBundleId: 'com.example.testFlutterZens',
  );
}
