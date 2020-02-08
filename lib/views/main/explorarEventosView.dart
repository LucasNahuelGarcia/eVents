import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../globalData/evento.dart';
import 'cardEvento.dart';
import '../../globalData/firebase.dart' as db;

class ExplorarEventosView extends StatelessWidget {
  final List<Evento> _eventos;

  ExplorarEventosView(this._eventos);

  @override
  Widget build(BuildContext context) {
    Widget res;
    if (_eventos.length == 0) {
      res = LinearProgressIndicator();
    } else {
      res = RefreshIndicator(
        onRefresh: () => db.updateEventos(),
        child: ListView.builder(
          itemCount: _eventos.length,
          itemBuilder: (context, i) => CardEvento(_eventos[i]),
        ),
      );
    }
    return res;
  }
}
