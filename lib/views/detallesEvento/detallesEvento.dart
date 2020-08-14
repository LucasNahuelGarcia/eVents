import 'package:events/globalData/evento.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetallesEventoView extends StatelessWidget {
  static const routeName = '/detallesEvento';

  @override
  Widget build(BuildContext context) {
    final Evento _evento = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 270,
            child: _evento.referenciaImagen != ""
                ? CachedNetworkImage(
                    imageUrl: _evento.referenciaImagen,
                    placeholder: (context, url) => Container(
                      child: LinearProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    "res/imageHolder.svg",
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _evento.nombre,
                    textScaleFactor: 2,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Divider(),
                  Text(_evento.descripcion),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
