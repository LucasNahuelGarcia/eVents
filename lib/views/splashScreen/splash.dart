import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:events/globalData/auth.dart' as auth;

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((currentUser) async {
      if (currentUser != null) {
        auth.userRef = currentUser;
        print("hay usuario...redireccionando a main...");
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        print("no hay usuario...redireccionando a login...");
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "eVents",
          textScaleFactor: 4.0,
        ),
      ),
    );
  }
}
