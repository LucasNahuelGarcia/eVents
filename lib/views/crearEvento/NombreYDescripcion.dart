import 'package:flutter/material.dart';

class FormNombreYDescripcion extends StatefulWidget {
  FormNombreYDescripcion(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormNombreYDescripcionState();
  }
}

class FormNombreYDescripcionState extends State<FormNombreYDescripcion> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String nombre;
  String descripcion;

  bool validate() => _formKey.currentState.validate();
  void save() => _formKey.currentState.save();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "El gran evento del siglo",
                  helperText: "Nombre",
                ),
                maxLength: 25,
                autovalidate: false,
                style: TextStyle(fontSize: 30),
                textCapitalization: TextCapitalization.sentences,
                autofocus: false,
                onSaved: (val) {
                  nombre = val;
                },
                validator: (value) {
                  if (value.isEmpty)
                    return "Nombre es requerido";
                  else
                    return null;
                },
              ),
              Divider(),
              TextFormField(
                minLines: 2,
                maxLines: 5,
                maxLength: 125,
                decoration: InputDecoration(
                  hintText:
                      "En este evento vamos a hacer tantas cosas, pero tantas.\nQue es como que un monton de cosas.",
                  helperText: "Descripción",
                ),
                onSaved: (val) {
                  descripcion = val;
                },
                validator: (value) {
                  if (value.isEmpty)
                    return "Descripcion es requerido";
                  else
                    return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
