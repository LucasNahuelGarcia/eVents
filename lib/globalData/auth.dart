import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Este archivo contiene todos los metodos de autenticacion
///y esas cosas

FirebaseUser userRef;

abstract class SignInMethod {
  static const int facebook = 1;
  static const int google = 2;
}

/// Inicia sesion con el metodo elegido
Future<bool> signIn(int credencial) async {
  switch (credencial) {
    case (SignInMethod.google):
      userRef = await _googleSignIn();
      break; //TODO: login con facebook y otros autenticadores
    default:
      userRef = null;
  }
  return userRef != null;
}

///geter para el parametro user


Future<FirebaseUser> _googleSignIn() async {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication authentication =
      await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: authentication.idToken, accessToken: authentication.accessToken);

  FirebaseUser user;

  await FirebaseAuth.instance
      .signInWithCredential(credential)
      .catchError((error) => {
            print("error de inicio de sesion con google: $error"),
            user = null,
          })
      .then((cred) => {
            user = cred.user,
          });

  return user;
}
