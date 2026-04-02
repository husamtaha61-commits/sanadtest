import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth firebaseAuth;
  final FacebookAuth facebookAuth;
  final GoogleSignIn googleSignIn;

  AuthService(this.firebaseAuth, this.facebookAuth, this.googleSignIn);

  Future<List?> signInByFacebook() async {
    final LoginResult loginResult = await facebookAuth.login(
      permissions: [
        'email',
        'public_profile',
        'user_birthday',
      ],
    );

    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      var userCredintal =
          await firebaseAuth.signInWithCredential(facebookAuthCredential);

      var idToken = await userCredintal.user?.getIdToken();

      return [userCredintal, facebookAuthCredential.accessToken, idToken];
    }
    return null;
  }

  Future<List?> signInByGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var userCredential = await firebaseAuth.signInWithCredential(credential);
      return [
        userCredential,
        googleAuth.accessToken,
        googleAuth.idToken,
      ];
    }
    return null;
  }

  Future<List?> signInByApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(oauthCredential);

      return [
        userCredential,
        appleCredential.authorizationCode,
        appleCredential.identityToken,
      ];
    } catch (e) {
      return null;
    }
  }
}
