import 'package:firebase_database/firebase_database.dart';

class Medicina {
  //Datos
  String id;
  String nombre;
  String clasificacion;
  String administracion;
  String tipoVenta;
  String compuestos;
  String dosis;
  String contenido;
  String temperatura;
  String status;

  Medicina(
      this.id,
      this.nombre,
      this.clasificacion,
      this.administracion,
      this.tipoVenta,
      this.compuestos,
      this.dosis,
      this.contenido,
      this.temperatura,
      this.status);

  //Mapeo para estructurar los datos
  Medicina.map(dynamic obj) {
    this.nombre = obj['nombre'];
    this.clasificacion = obj['clasificacion'];
    this.administracion = obj['administracion'];
    this.tipoVenta = obj['tipoVenta'];
    this.compuestos = obj['compuestos'];
    this.dosis = obj['dosis'];
    this.contenido = obj['contenido'];
    this.temperatura = obj['temperatura'];
    this.status = obj['status'];
  }

  //obtener la información(getters de variables)

  String get getID => id;
  String get getNombre => nombre;
  String get getClasificacion => clasificacion;
  String get getAdministracion => administracion;
  String get getTipoVenta => tipoVenta;
  String get getCompuestos => compuestos;
  String get getDosis => dosis;
  String get getContenido => contenido;
  String get getTemperatura => temperatura;
  String get getStatus => status;

  //Modelo para creacion en la base de datos
  Medicina.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    clasificacion = snapshot.value['clasificacion'];
    administracion = snapshot.value['administracion'];
    tipoVenta = snapshot.value['tipoVenta'];
    compuestos = snapshot.value['compuestos'];
    dosis = snapshot.value['dosis'];
    contenido = snapshot.value['contenido'];
    temperatura = snapshot.value['temperatura'];
    status = snapshot.value['status'];
  }
}
