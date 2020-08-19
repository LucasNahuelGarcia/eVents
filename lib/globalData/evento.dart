import 'package:flutter/material.dart';
import 'package:quiver/core.dart';

class Evento {
  final String nombre;
  final String descripcion;
  final String id;
  final String creador;
  String referenciaImagen;

  Evento(
      {this.id,
      this.creador,
      @required this.nombre,
      @required this.descripcion,
      this.referenciaImagen});

  bool operator ==(o) => o is Evento && o.id == id;
  int get hashCode => hash2(id.hashCode, nombre.hashCode);
}
