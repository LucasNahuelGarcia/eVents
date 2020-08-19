import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:events/globalData/evento.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SelectorImagen.dart';

class FormEvento extends StatefulWidget {
  FormEvento(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormEventoState();
  }
}

class FormEventoState extends State<FormEvento> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: "_keyDelForm");

  String _nombre;
  String _descripcion;

  Evento submit() {
    Evento evento;
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      evento = Evento(descripcion: _descripcion, nombre: _nombre);
      print("nombre: $_nombre\ndescripcion: $_descripcion");
    }
    return evento;
  }

  bool checkForm() {
    return formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SelectorImagen(),
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
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
                      _nombre = val;
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
                      _descripcion = val;
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
        ),
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SvgPicture.asset(
                    'res/mapaUbicacion.svg',
                    fit: BoxFit.cover,
                    allowDrawingOutsideViewBox: false,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Avellaneda al 500, Madagascar."),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
