import 'package:flutter/material.dart';

class InfoEvento extends StatelessWidget {
  final String nombreEvento;
  final String descripcionEvento;
  InfoEvento(this.nombreEvento, this.descripcionEvento);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          nombreEvento,
          textAlign: TextAlign.left,
          style: TextStyle(),
          textScaleFactor: 2.0,
        ),
        Text(
          descripcionEvento,
          textAlign: TextAlign.left,
          style: TextStyle(),
          textScaleFactor: 1.0,
        ),
      ],
    );
  }
}
