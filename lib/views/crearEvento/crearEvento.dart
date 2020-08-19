import 'package:events/globalData/evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'FormEvento.dart';
import '../../globalData/firebase.dart' as db;

class CrearEventoView extends StatelessWidget {
  GlobalKey<FormEventoState> formKey;

  @override
  Widget build(BuildContext context) {
    formKey = GlobalKey<FormEventoState>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _crearEvento(context),
        child: SvgPicture.asset("res/upload.svg", color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 300),
        scrollDirection: Axis.vertical,
        child: FormEvento(formKey),
      ),
    );
  }

  void _crearEvento(BuildContext context) {
    if (formKey.currentState.checkForm()) {
      print("Creando nuevo evento ------------------------");
      Evento evento = formKey.currentState.submit();
      db.crearEvento(evento);
      Navigator.of(context).pop();
    }
  }
}
