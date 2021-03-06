import 'package:events/globalData/evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../globalData/ComunicacionServer.dart' as db;
import 'NombreYDescripcion.dart';
import 'SelectorImagen.dart';
import 'SelectorUbicacion.dart';

class CrearEventoView extends StatelessWidget {
  final GlobalKey<FormNombreYDescripcionState> nombreYdescripcionKey =
      GlobalKey<FormNombreYDescripcionState>();
  final GlobalKey<SelectorImagenState> imagenKey =
      GlobalKey<SelectorImagenState>();

  @override
  Widget build(BuildContext context) {
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
            SelectorImagen(imagenKey),
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
      imagenKey.currentState.save();

      Evento evento = Evento(
        nombre: nombreYdescripcionKey.currentState.nombre,
        descripcion: nombreYdescripcionKey.currentState.descripcion,
        referenciaImagen: imagenKey.currentState.imagePath,
      );

      db.crearEvento(evento);
      Navigator.of(context).pop();
    }
  }
}
