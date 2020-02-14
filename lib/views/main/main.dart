import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import '../../globalData/evento.dart';
import 'eventosGuardadosView.dart';
import 'suscripcionesView.dart';
import 'navBar.dart';
import 'explorarEventosView.dart';
import '../../globalData/user.dart' as userData;
import '../../globalData/firebase.dart' as db;
import '../../globalData/eventos.dart' as eventosData;

class MainView extends StatelessWidget {
  static const int _DEFAULT_PAGE = 0;
  final ValueNotifier<int> _paginaActual = ValueNotifier(_DEFAULT_PAGE);

  @override
  Widget build(BuildContext context) {
    db.updateEventos();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "eVents",
          textScaleFactor: 1.5,
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                userData.userName ?? "<nombre>",
                textScaleFactor: 1.5,
              ),
              curve: Curves.easeInOutExpo,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<int>(
          valueListenable: _paginaActual,
          builder: (context, value, child) {
            Widget res;
            switch (value) {
              case 0:
                res = ValueListenableBuilder<List<Evento>>(
                    valueListenable: eventosData.Eventos.getNotifier,
                    builder: (context, value, child) =>
                        ExplorarEventosView(value));
                break;
              case 1:
                res = EventosGuardadosView();
                break;
              case 2:
                res = SuscripcionesView();
                break;
            }

            return res;
          }),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _paginaActual,
        builder: (context, value, child) => FloatingNavBar(_paginaActual),
      ),
    );
  }
}
