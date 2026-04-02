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
    apiKey: 'AIzaSyAfbugYuB6k-Uwn5UeY_FFTgZOvUHpheQw',
    appId: '1:572632106609:android:f28ac23a2d5a9e5ed93dd0',
    messagingSenderId: '572632106609',
    projectId: 'sanad-quran-735b3',
    storageBucket: 'sanad-quran-735b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA72hzw_yYEoFEhOGjXAVO54L7NnL5dRlc',
    appId: '1:572632106609:ios:6b537f0c444d05afd93dd0',
    messagingSenderId: '572632106609',
    projectId: 'sanad-quran-735b3',
    storageBucket: 'sanad-quran-735b3.appspot.com',
    iosBundleId: 'com.sanadquran.sanad',
  );
}
