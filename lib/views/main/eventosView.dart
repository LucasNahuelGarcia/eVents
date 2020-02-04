import 'package:flutter/material.dart';
import 'cardEvento.dart';
import '../globalData/eventos.dart' as eventosData;

class EventosView extends StatelessWidget {
  final List<eventosData.Evento> _eventos;

  EventosView(this._eventos);

  @override
  Widget build(BuildContext context) {
    Widget res;
    if (_eventos.length == 0) {
      res = ListView.builder(
        itemCount: 1,
        itemBuilder: (context, i) {
          return CardEvento("?????????????????", "??????????", "");
        },
      );
    } else {
      res = ListView.builder(
        itemCount: _eventos.length,
        itemBuilder: (context, i) {
          eventosData.Evento e = _eventos[i];
          return CardEvento(e.nombre, e.descripcion, e.id);
        },
      );
    }
    return res;
  }
}