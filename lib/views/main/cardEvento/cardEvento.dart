import 'package:events/views/main/cardEvento/imagenEvento.dart';
import 'package:flutter/material.dart';
import '../../detallesEvento/detallesEvento.dart';
import 'package:events/globalData/evento.dart';

import 'userInfoBar.dart';
import 'infoEvento.dart';

class CardEvento extends StatelessWidget {
  final Evento _evento;
  CardEvento(this._evento);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      semanticContainer: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetallesEventoView.routeName,
            arguments: _evento,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ImagenEvento(_evento.referenciaImagen),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  UserInfoBar(_evento.creador),
                  InfoEvento(_evento.nombre, _evento.descripcion),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
