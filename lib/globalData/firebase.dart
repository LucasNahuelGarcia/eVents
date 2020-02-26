import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'evento.dart';
import './auth.dart' as userData;
import './eventos.dart' as eventosData;

const String _usuariosRef = "usuarios";
const String _eventosRef = "eventos";

///A partir de una referencia de documento de firebase, devuelve una url para descargar
///dicho documento
Future<String> imagePath(DocumentReference path) async {
  String pathFormateada = '/' + path.path.split('/')[1];

  pathFormateada = await FirebaseStorage.instance
      .ref()
      .child(pathFormateada)
      .getDownloadURL();
  return pathFormateada;
}

///Chequea la existencia del usuario en la base de datos
Future<bool> checkUserExists() async {
  bool exists = false;
  DocumentSnapshot doc = await Firestore.instance
      .collection(_usuariosRef)
      .document(userData.userRef.uid)
      .get();

  exists = doc.exists;

  return exists;
}

///Actualiza la lista local de eventos con los 20 mas ceranos de
///la DB.
///
///Realiza esto reemplazando la lista original con una nueva, disparando el
///ValueNotifier de la misma
Future updateEventos() async {
  DataSnapshot snapshot =
      await FirebaseDatabase.instance.reference().child("eventos").once();
  Map<dynamic, dynamic> data = snapshot.value;
  List<Evento> _eventosAux = List<Evento>();

  for (int i = 0; i < data.entries.length; i++) {
    MapEntry<dynamic, dynamic> value = data.entries.elementAt(i);
    print("--------------evento----------------");
    String idCreador = value.value['creador'];
    if(idCreador == userData.userRef.uid)
      continue;
    String refIMG = value.value['refIMG'];

    DataSnapshot _snapCreador = await FirebaseDatabase.instance
        .reference()
        .child("usuarios")
        .child(idCreador)
        .child("nombre")
        .once();
    String nombreCreador = _snapCreador.value ?? "<Nombre del creador>";

    Evento newEvent = Evento(
      value.value['nombre'],
      value.value['descripcion'],
      value.value.toString(),
      nombreCreador,
    );

    print("    nombre: ${value.value['nombre']}");
    print("    Descripcion: ${value.value['descripcion']}");
    print("    Creador: ${nombreCreador}");
    print("    IMGref: $refIMG");

    _eventosAux.add(newEvent);
    print("--------------agregado----------------");
  }

  eventosData.Eventos.replace(_eventosAux);
  print("eventos en lista: ${eventosData.Eventos.length}");
}

Future<bool> crearEvento(String nombre, String descripcion) async {
  Map<String, dynamic> data = {
    //esto es lo que se sube a firebase DB
    "nombre": nombre,
    "descripcion": descripcion,
  };

  await FirebaseDatabase.instance
      .reference()
      .child(_eventosRef)
      .push()
      .set(data);

  return true;
}
