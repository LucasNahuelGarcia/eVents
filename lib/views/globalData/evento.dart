import 'package:quiver/core.dart';

class Evento {
  final String nombre;
  final String descripcion;
  final String id;

  Evento(this.nombre, this.descripcion, this.id);

  bool operator ==(o) => o is Evento && o.id == id;
  int get hashcode => hash2(id.hashCode, nombre.hashCode);
}
