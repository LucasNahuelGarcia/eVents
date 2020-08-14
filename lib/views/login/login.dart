import 'package:flutter/material.dart';
import '../../globalData/auth.dart' as authF;

class LoginView extends StatelessWidget {
  void _logIn(int credencial, BuildContext context) async {
    print("intentando ingresar...");
    try {
      if (await authF.signIn(authF.SignInMethod.google)) {
        print("se ingreso correctamente");
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        print("no se pudo iniciar sesion");
      }
    } catch (e) {
      print("excepcion en login con google");
      print(e.toString());
    }
  }

  void _decirPendiente(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Pendientee"),
    ));
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: PreferredSize(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text("Seleccione un método de ingreso"),
          ),
          preferredSize: Size.fromHeight(100.0)),
      body: Builder(
        builder: (BuildContext context) => Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              children: <Widget>[
                RaisedButton(
                  onPressed: () =>
                      {_logIn(authF.SignInMethod.google, buildContext)},
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
        ),
      ),
    );
  }
}
