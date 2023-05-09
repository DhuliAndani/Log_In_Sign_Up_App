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
    apiKey: 'AIzaSyC9Mt2Yii4ODtT2zrAPL1_RNADcEDZ6t2I',
    appId: '1:384456707763:web:0265f2a1a8e45986c0eac6',
    messagingSenderId: '384456707763',
    projectId: 'login-sign-up-app-9bb79',
    authDomain: 'login-sign-up-app-9bb79.firebaseapp.com',
    storageBucket: 'login-sign-up-app-9bb79.appspot.com',
    measurementId: 'G-2YERPL921E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_AcWHRc79gpo_r0EnYIkoNLZYR-gQIjk',
    appId: '1:384456707763:android:d73e814e36bb2f58c0eac6',
    messagingSenderId: '384456707763',
    projectId: 'login-sign-up-app-9bb79',
    storageBucket: 'login-sign-up-app-9bb79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBXJCEdkuAah85lZdrDjXOD0FAQPV6_0U',
    appId: '1:384456707763:ios:8999889b061cb21ac0eac6',
    messagingSenderId: '384456707763',
    projectId: 'login-sign-up-app-9bb79',
    storageBucket: 'login-sign-up-app-9bb79.appspot.com',
    iosClientId: '384456707763-e76da3ad5n3ppv74dkmn25clvj021inm.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginSignUpApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBXJCEdkuAah85lZdrDjXOD0FAQPV6_0U',
    appId: '1:384456707763:ios:8999889b061cb21ac0eac6',
    messagingSenderId: '384456707763',
    projectId: 'login-sign-up-app-9bb79',
    storageBucket: 'login-sign-up-app-9bb79.appspot.com',
    iosClientId: '384456707763-e76da3ad5n3ppv74dkmn25clvj021inm.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginSignUpApp',
  );
}
