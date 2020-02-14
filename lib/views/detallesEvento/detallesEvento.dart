import 'package:events/globalData/evento.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetallesEventoView extends StatelessWidget {
  static const routeName = '/detallesEvento';

  @override
  Widget build(BuildContext context) {
    final Evento _evento = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
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
          Text(_evento.nombre),
          Text(_evento.descripcion),
        ],
      ),
    );
  }
}
