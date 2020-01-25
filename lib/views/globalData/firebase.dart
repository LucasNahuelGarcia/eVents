import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './user.dart' as userData;

const String _usuariosRef = "usuarios";
const String _eventosRef = "eventos";

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

///Requiere un usuario logueado.
///
///Actualiza la informacion de firebase con la informacion local
///de la cuenta
void updateDB() {
  Map<String, dynamic> data = {
    //esto es lo que se sube a firebase DB
    "nombre": userData.userName,
    "descripcion": userData.userDescription,
  };

  Firestore.instance
      .collection(_usuariosRef)
      .document(userData.userRef.uid)
      .setData(data);
}

///Requiere un usuario logueado
///
///Actualiza la informacion local de la cuenta con la
///informacion de firebase
void updateLocal() {
  Firestore.instance
      .collection(_usuariosRef)
      .document(userData.userRef.uid)
      .get()
      .then((documentSnapshot) => {
            userData.userName = documentSnapshot.data['nombre'],
            userData.userDescription = documentSnapshot.data['descripcion'],
          });
}

void crearEvento() {
  //TODO() crear evento
}
