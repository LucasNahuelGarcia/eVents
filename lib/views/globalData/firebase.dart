import 'package:cloud_firestore/cloud_firestore.dart';
import 'evento.dart';
import './user.dart' as userData;
import './eventos.dart' as eventosData;

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
void updateUserDB() {
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
void updateUserLocal() {
  Firestore.instance
      .collection(_usuariosRef)
      .document(userData.userRef.uid)
      .get()
      .then((documentSnapshot) => {
            userData.userName = documentSnapshot.data['nombre'],
            userData.userDescription = documentSnapshot.data['descripcion'],
          });
}

///Actualiza la lista local de eventos con los 20 mas ceranos de
///la DB.
Future updateEventos() async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection(_eventosRef).getDocuments();

  List<Evento> _eventosAux = List<Evento>();
  for (int i = 0; i < snapshot.documents.length; i++) {
    DocumentSnapshot doc = snapshot.documents[i];
    Evento newEvent = Evento(doc['nombre'], doc['descripcion'], doc.documentID);

    print("Se registro un nuevo evento:");
    print("    nombre: ${doc['nombre']}");
    print("    Descripcion: ${doc['descripcion']}");
    _eventosAux.add(newEvent);
    print("eventos en lista: ${eventosData.Eventos.length}");
  }

  eventosData.Eventos.replace(_eventosAux);
}

void crearEvento() {
  //TODO() crear evento
}
