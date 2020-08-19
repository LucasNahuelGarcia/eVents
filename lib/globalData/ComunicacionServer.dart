import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'evento.dart';
import 'auth.dart' as userData;
import 'eventos.dart' as eventosData;

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

///Actualiza la lista local de eventos
Future updateEventos() async {
  Map data = await getEventosFromFirebase();
  List<Evento> _eventos = List<Evento>();
  for (int i = 0; i < data.entries.length; i++)
    _eventos.add(await parseEvento(data.entries.elementAt(i)));

  eventosData.Eventos.replace(_eventos);
  print("eventos en lista: ${_eventos.length}");
  print("eventos en lista: ${eventosData.Eventos.length}");
}

Future<Evento> parseEvento(MapEntry element) async {
  print("--------------evento-------------------------------");
  print("   Creador: ");
  String nombreCreador =
      await getNombreCreadorFromUID(element.value['creador']);
  print("            $nombreCreador");

  print("    Referencia imagen:");
  String refIMG = element.value['refIMG'] ?? "";
  if (refIMG != "" && refIMG != null)
    refIMG = await findFirebaseStorageDownloadReference(refIMG);
  print("                       $refIMG");

  print("    Descripcion:");
  String descripcion = element.value['descripcion'] ?? "";
  print("                  $descripcion");

  print("    nombre:");
  String nombre = element.value['nombre'] ?? "";
  print("             $nombre");

  print("    ID:");
  String id = element.key ?? "";
  print("            $id");

  Evento evento = Evento(
    nombre: nombre,
    descripcion: descripcion,
    id: id,
    creador: nombreCreador,
    referenciaImagen: refIMG,
  );

  return evento;
}

Future<String> getNombreCreadorFromUID(String idCreador) async {
  String nombre = "<Nombre del Usuario>";
  try {
    DataSnapshot _snapCreador = await FirebaseDatabase.instance
        .reference()
        .child("usuarios")
        .child(idCreador)
        .child("nombre")
        .once();
    nombre = _snapCreador.value;
  } catch (e) {
    print(">>Error en la busqueda del usuario en firebase.");
  }
  return nombre;
}

Future<Map> getEventosFromFirebase() async {
  DataSnapshot snapshot =
      await FirebaseDatabase.instance.reference().child("eventos").once();
  Map<dynamic, dynamic> data = snapshot.value;
  return data;
}

Future<String> findFirebaseStorageDownloadReference(String refIMG) async {
  try {
    refIMG =
        await FirebaseStorage.instance.ref().child(refIMG).getDownloadURL();
    print("    IMGref: $refIMG");
  } catch (e) {
    print("error encontrando la imagen del evento: $refIMG");
    e.toString();
    refIMG = "";
  }
  return refIMG;
}

Future<bool> crearEvento(Evento evento) async {
  print("Creando evento en firebase...");
  Map<String, dynamic> data = {
    "nombre": evento.nombre,
    "descripcion": evento.descripcion,
  };
  print("nombre: ${evento.nombre}\ndescripcion: ${evento.descripcion}");
  await FirebaseDatabase.instance
      .reference()
      .child(_eventosRef)
      .push()
      .set(data);

  return true;
}
