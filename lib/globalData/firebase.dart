import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'evento.dart';
import './user.dart' as userData;
import './eventos.dart' as eventosData;

const String _usuariosRef = "usuarios";
const String _eventosRef = "eventos";

///A partir de una referencia de documento de firebase, devuelve una url para descargar
///dicho documento
Future<String> imagePath(DocumentReference path) async {
  String pathFormateada = '/' + path.path.split('/')[1];
  return await FirebaseStorage.instance
      .ref()
      .child(pathFormateada)
      .getDownloadURL();
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

///Requiere un usuario logueado.
///
///Actualiza la informacion de firebase con la informacion local
///de la cuenta
void updateUserDB() {
  Map<String, dynamic> data = {
    //esto es lo que se sube a firebase DB
    "nombre": userData.userName,
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
Future updateUserLocal() async {
  DocumentSnapshot documentSnapshot = await Firestore.instance
      .collection(_usuariosRef)
      .document(userData.userRef.uid)
      .get();

  userData.userName = documentSnapshot.data['nombre'];
  userData.userDescription = documentSnapshot.data['descripcion'];
}

///Actualiza la lista local de eventos con los 20 mas ceranos de
///la DB.
///
///Realiza esto reemplazando la lista original con una nueva, disparando el
///ValueNotifier de la misma
Future updateEventos() async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection(_eventosRef).getDocuments();

  List<Evento> _eventosAux = List<Evento>();
  for (int i = 0; i < snapshot.documents.length; i++) {
    DocumentSnapshot doc = snapshot.documents[i];

    //formateo la referencia de imagen a un link usable
    DocumentReference imgRef = doc['refIMG'];
    String refIMG;
    if (imgRef != null) refIMG = await imagePath(imgRef);

    //obtengo el nombre del creador del evento
    DocumentReference docCreadorRef = doc['creador'];
    DocumentSnapshot docCreador;
    String nombreCreador = "creador";
    if (docCreadorRef != null) {
      docCreador = await Firestore.instance.document(docCreadorRef.path).get();
      nombreCreador = docCreador['nombre'];
    }

    Evento newEvent = Evento(
        doc['nombre'], doc['descripcion'], doc.documentID, nombreCreador,
        referenciaImagen: refIMG);

    print("Se registro un nuevo evento:");
    print("    nombre: ${doc['nombre']}");
    print("    Descripcion: ${doc['descripcion']}");
    print("    Creador: $nombreCreador");
    print("    IMGref sin formato: $imgRef");
    print("    IMGref con formato: $refIMG");

    _eventosAux.add(newEvent);
  }

  eventosData.Eventos.replace(_eventosAux);
  print("eventos en lista: ${eventosData.Eventos.length}");
}

void crearEvento() {
  //TODO() crear evento
}
