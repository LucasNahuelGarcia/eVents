import 'package:flutter/material.dart';
import 'package:quiver/core.dart';

class Evento {
  final String nombre;
  final String descripcion;
  final String id;
  final String creador;
  final String referenciaImagen;

  Evento(
      {@required this.id,
      @required this.creador,
      @required this.nombre,
      this.descripcion,
      this.referenciaImagen});

  bool operator ==(o) => o is Evento && o.id == id;
  int get hashCode => hash2(id.hashCode, nombre.hashCode);
}
