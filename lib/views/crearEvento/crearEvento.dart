import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../globalData/firebase.dart' as db;

class CrearEventoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.5,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              child: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("res/imageHolder.png")),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FormEvento(),
            ),
          ],
        ),
      ),
    );
  }
}

class FormEvento extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormEventoState();
  }
}

class FormEventoState extends State<FormEvento> {
  final _formKey = GlobalKey<FormState>();
  String _nombre;
  String _descripcion;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextFormField(
            onChanged: (val) {
              _nombre = val;
            },
            initialValue: "Nombre",
            maxLength: 25,
            autovalidate: true,
            style: TextStyle(fontSize: 30),
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            validator: (value) {
              if (value.isEmpty)
                return "Nombre es requerido";
              else
                return null;
            },
          ),
          TextFormField(
            onChanged: (val) {
              _descripcion = val;
            },
            minLines: 1,
            maxLines: 5,
            maxLength: 125,
            validator: (value) {
              if (value.isEmpty)
                return "Descripcion del evento";
              else
                return null;
            },
          ),
          RaisedButton(
            onPressed: () async {
              await db.crearEvento(_nombre,_descripcion);
              Navigator.of(context).pop();
            },
            child: Text(
              "crear",
              textScaleFactor: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
