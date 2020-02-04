import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navBar.dart';
import 'eventosView.dart';
import '../globalData/user.dart' as userData;
import '../globalData/firebase.dart' as db;
import '../globalData/eventos.dart' as eventosData;

class MainView extends StatelessWidget {
  final ValueListenable<int> cantidadDeEventosNotifier = ValueNotifier(eventosData.Eventos.length);
  
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FloatingNavBar(),
        ),
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
      body: ValueListenableBuilder<List<eventosData.Evento>>(
        valueListenable: eventosData.Eventos.getNotifier,
        builder: (context, value, child) {
          return EventosView(value);
        },
      ),
    );
  }
}
