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
    apiKey: 'AIzaSyATj3SEB_aPzC0ES56jIABqz6yltNfwMfE',
    appId: '1:651872402291:web:77a21ba6e8f66adfd16306',
    messagingSenderId: '651872402291',
    projectId: 'rentaliti',
    authDomain: 'rentaliti.firebaseapp.com',
    storageBucket: 'rentaliti.appspot.com',
    measurementId: 'G-M6QEQ9XKYC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRFTvmIjNm3RgMT0ng2CiSiULJnoKTUT0',
    appId: '1:651872402291:android:e6279abdb6756b63d16306',
    messagingSenderId: '651872402291',
    projectId: 'rentaliti',
    storageBucket: 'rentaliti.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqVkCSfY5WF9SxW-9RpN5QwFSsxwIBjA8',
    appId: '1:651872402291:ios:88130ffd48636d55d16306',
    messagingSenderId: '651872402291',
    projectId: 'rentaliti',
    storageBucket: 'rentaliti.appspot.com',
    iosBundleId: 'com.example.rentaliti',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqVkCSfY5WF9SxW-9RpN5QwFSsxwIBjA8',
    appId: '1:651872402291:ios:88130ffd48636d55d16306',
    messagingSenderId: '651872402291',
    projectId: 'rentaliti',
    storageBucket: 'rentaliti.appspot.com',
    iosBundleId: 'com.example.rentaliti',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyATj3SEB_aPzC0ES56jIABqz6yltNfwMfE',
    appId: '1:651872402291:web:d0ccf44f324762fdd16306',
    messagingSenderId: '651872402291',
    projectId: 'rentaliti',
    authDomain: 'rentaliti.firebaseapp.com',
    storageBucket: 'rentaliti.appspot.com',
    measurementId: 'G-WVCX8D8QC8',
  );
}
