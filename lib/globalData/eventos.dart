import 'package:flutter/cupertino.dart';
import 'evento.dart';

 class Eventos {
  static ValueNotifier<List<Evento>> _lista = ValueNotifier(List<Evento>());

  static ValueNotifier<List<Evento>> get getNotifier {
    return _lista;
  }

  static void add(Evento e) {
    _lista.value = List.from(_lista.value);
    _lista.value.add(e);
  }

  static void replace(List<Evento> e){
    _lista.value = List.from(e);
  }

  static bool contains(Evento e) {
    return _lista.value.contains(e);
  }

  static Evento onIndex (int i) {
    return _lista.value[i];
  }

  static int get length {
    return _lista.value.length;
  }

  static void clear() {
    _lista.value = List.from(_lista.value);
    _lista.value.clear();
  }
}

//List<Evento> lista = new List<Evento>();