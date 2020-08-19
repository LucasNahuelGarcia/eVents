import 'package:events/globalData/evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../globalData/firebase.dart' as db;
import 'NombreYDescripcion.dart';
import 'SelectorImagen.dart';
import 'SelectorUbicacion.dart';

class CrearEventoView extends StatelessWidget {
  GlobalKey<FormNombreYDescripcionState> nombreYdescripcionKey;

  @override
  Widget build(BuildContext context) {
    nombreYdescripcionKey = GlobalKey<FormNombreYDescripcionState>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _crearEvento(context),
        child: SvgPicture.asset("res/upload.svg", color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 300),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SelectorImagen(),
            FormNombreYDescripcion(nombreYdescripcionKey),
            SelectorUbicacion(),
          ],
        ),
      ),
    );
  }

  void _crearEvento(BuildContext context) {
    bool validado = nombreYdescripcionKey.currentState.validate();
    if (validado) {
      nombreYdescripcionKey.currentState.save();

      Evento evento = Evento(
        nombre: nombreYdescripcionKey.currentState.nombre,
        descripcion: nombreYdescripcionKey.currentState.descripcion,
      );

      db.crearEvento(evento);
      Navigator.of(context).pop();
    }
  }
}
