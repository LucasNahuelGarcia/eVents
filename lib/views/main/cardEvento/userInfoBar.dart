import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInfoBar extends StatelessWidget {
  final String nombreCreador;
  UserInfoBar(this.nombreCreador);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          elevation: 0,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(
            'res/userPicturePlaceHolder.svg',
            fit: BoxFit.cover,
            height: 30,
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
