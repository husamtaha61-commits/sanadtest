import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM4wKg3pcpy1klaAlxLyoDARqs6Oh2rX4',
    appId: '1:626069124894:android:f1f24b35eb9930c3533b0f',
    messagingSenderId: '626069124894',
    projectId: 'sanad-quran-dev-c5b7c',
    storageBucket: 'sanad-quran-dev-c5b7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv2HvySOcYCRlctnntQDTYncXyl1llx3I',
    appId: '1:626069124894:ios:4c3d677767356db1533b0f',
    messagingSenderId: '626069124894',
    projectId: 'sanad-quran-dev-c5b7c',
    storageBucket: 'sanad-quran-dev-c5b7c.appspot.com',
    iosBundleId: 'com.sanadquran.sanad.dev',
  );
}
