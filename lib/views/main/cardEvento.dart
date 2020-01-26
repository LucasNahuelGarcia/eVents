import 'package:flutter/material.dart';

class CardEvento extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String uidEvento;
  CardEvento(this.titulo, this.descripcion,this.uidEvento);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(25),
        color: Colors.white,
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 170,
                color: Colors.grey,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("res/imageHolder.png"),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        titulo,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        textScaleFactor: 2.0,
                      ),
                      Text(
                        descripcion,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
