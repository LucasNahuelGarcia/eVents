import 'package:flutter/material.dart';
import '../../globalData/evento.dart';
import 'cardEvento.dart';

class EventosView extends StatelessWidget {
  final List<Evento> _eventos;

  EventosView(this._eventos);

  @override
  Widget build(BuildContext context) {
    Widget res;
    if (_eventos.length == 0) {
      res = LinearProgressIndicator();
    } else {
      res = ListView.builder(
          itemCount: _eventos.length,
          itemBuilder: (context, i) => CardEvento(_eventos[i]));
    }
    return res;
  }
}
