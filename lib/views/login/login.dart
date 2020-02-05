import 'package:flutter/material.dart';
import '../../globalData/auth.dart' as authF;

class LoginView extends StatelessWidget {
  void _logIn(int credencial, BuildContext context) async {
    
    print("intentando ingresar...");
    if (await authF.signIn(authF.SignInMethod.google)) {
      print("se ingreso correctamente");
      Navigator.pushReplacementNamed(context, "/main");
    } else {
      print("no se pudo iniciar sesion");
    }
  }

  void _decirPendiente(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Pendientee"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  //Titulo
                  "eVents",
                  textAlign: TextAlign.center,
                  textScaleFactor: 6,
                ),
                Padding(
                  //opciones de registro
                  padding: EdgeInsets.symmetric(vertical: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () =>
                            {_logIn(authF.SignInMethod.google, context)},
                        child: Text("Ingresar con Google"),
                      ),
                      RaisedButton(
                        onPressed: () => {_decirPendiente(context)},
                        child: Text("Ingresar con Facebook"),
                      ),
                      FlatButton(
                        onPressed: () => {_decirPendiente(context)},
                        child: Text("Omitir"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
