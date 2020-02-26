import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/globalData/evento.dart';
import 'userInfoBar.dart';
import '../../detallesEvento/detallesEvento.dart';

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
            Container(
              height: 270,
              child: _evento.referenciaImagen != null
                  ? CachedNetworkImage(
                      imageUrl: _evento.referenciaImagen,
                      placeholder: (context, url) => Container(
                        child: LinearProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    )
                  : Image(
                      image: AssetImage("res/imageHolder.png"),
                      fit: BoxFit.fitHeight,
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  UserInfoBar(_evento.creador),
                  Text(
                    _evento.nombre,
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                    textScaleFactor: 2.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    _evento.descripcion,
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
