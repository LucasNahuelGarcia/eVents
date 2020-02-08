import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/globalData/evento.dart';

class CardEvento extends StatelessWidget {
  final Evento _evento;
  CardEvento(this._evento);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 170,
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
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        _evento.nombre,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        ),
                        textScaleFactor: 2.0,
                      ),
                      Divider(),
                      Text(
                        _evento.descripcion,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        ),
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
