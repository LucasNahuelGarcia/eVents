import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrearEventoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1.0,
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextFormField(
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
            onPressed: () => {},
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
