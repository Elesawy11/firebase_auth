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
    apiKey: 'AIzaSyB95vDE2-rb1da9xjY7aRx3GgVy9U7KG5Q',
    appId: '1:746905945609:web:e363594d49b7fca8469ad8',
    messagingSenderId: '746905945609',
    projectId: 'fir-auth-fa6ac',
    authDomain: 'fir-auth-fa6ac.firebaseapp.com',
    storageBucket: 'fir-auth-fa6ac.appspot.com',
    measurementId: 'G-VKWGZKCWFP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRO4OtJFTH6DUo1LVgqfvtYdnuFdKYb1A',
    appId: '1:746905945609:android:67d9a60648963055469ad8',
    messagingSenderId: '746905945609',
    projectId: 'fir-auth-fa6ac',
    storageBucket: 'fir-auth-fa6ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_PgLjjKsV8HEll0PXn_6f27Ykmy58H4k',
    appId: '1:746905945609:ios:b6fec97247b0d879469ad8',
    messagingSenderId: '746905945609',
    projectId: 'fir-auth-fa6ac',
    storageBucket: 'fir-auth-fa6ac.appspot.com',
    iosBundleId: 'com.example.firbaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_PgLjjKsV8HEll0PXn_6f27Ykmy58H4k',
    appId: '1:746905945609:ios:b6fec97247b0d879469ad8',
    messagingSenderId: '746905945609',
    projectId: 'fir-auth-fa6ac',
    storageBucket: 'fir-auth-fa6ac.appspot.com',
    iosBundleId: 'com.example.firbaseAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB95vDE2-rb1da9xjY7aRx3GgVy9U7KG5Q',
    appId: '1:746905945609:web:39133d0d9eceb87d469ad8',
    messagingSenderId: '746905945609',
    projectId: 'fir-auth-fa6ac',
    authDomain: 'fir-auth-fa6ac.firebaseapp.com',
    storageBucket: 'fir-auth-fa6ac.appspot.com',
    measurementId: 'G-84N4C7DL9T',
  );
}
