import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

import 'package:flutter/widgets.dart';
import '../../globalData/evento.dart';
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
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search),
            onPressed: () => {
              db.updateEventos(),
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.lighten,
                  color: Theme.of(context).buttonColor),
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
      body: ValueListenableBuilder<List<Evento>>(
          valueListenable: eventosData.Eventos.getNotifier,
          builder: (context, value, child) => ExplorarEventosView(value)),
      bottomNavigationBar: FloatingNavBar(_paginaActual),
    );
  }
}
