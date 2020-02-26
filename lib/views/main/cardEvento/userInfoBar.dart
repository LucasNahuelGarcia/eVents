import 'package:flutter/material.dart';

class UserInfoBar extends StatelessWidget {
  final String nombreCreador;
  UserInfoBar(this.nombreCreador);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          elevation: 1,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: Ink.image(
            image: AssetImage('res/imageHolder.png'),
            fit: BoxFit.cover,
            width: 35.0,
            height: 35.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        Text(
          nombreCreador ?? "<Creador del Evento>",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
