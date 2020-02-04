import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './user.dart' as userData;
import './firebase.dart' as db;

///Este archivo contiene todos los metodos de autenticacion
///y esas cosas

abstract class SignInMethod {
  static const int facebook = 1;
  static const int google = 2;
}

/// Inicia sesion con el metodo elegido
Future<bool> signIn(int credencial) async {
  FirebaseUser _user;
  switch (credencial) {
    case (SignInMethod.google):
      _user = await _googleSignIn();
      break; //TODO: login con facebook y otros autenticadores
    default:
      _user = null;
  }

  updateInfo(_user);
  bool res = _user != null;

  return res;
}

///Se actualiza el usuario en userData (globalData/user.dart) y luego se chequea
///la existencia de una entrada en la base de datos de firebase con el id del usuario
///si no existe se crea, si existe se actualiza la informacion de usuario con la
///de firebase
void updateInfo(FirebaseUser user) async {
  userData.userRef = user;

  if (await db.checkUserExists()) {
    print("el usuario si existia en firebase");

    db.updateUserLocal();
  } else {
    print("el usuario no existia en firebase");
    userData.userName = user.displayName;

    db.updateUserDB();
  }
}

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
      .then((cred) => {
            user = cred.user,
          })
      .catchError((error) => {
            print("error de inicio de sesion con google: $error"),
            user = null,
          });

  return user;
}
