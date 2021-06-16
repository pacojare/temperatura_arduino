import 'package:flutter/material.dart';
import 'package:temporatura_medicina/src/model/medicina.dart';
import 'package:firebase_database/firebase_database.dart';

class InfoMedicina extends StatefulWidget {
  final Medicina medicina;
  InfoMedicina(this.medicina);

  @override
  _InfoMedicinaState createState() => _InfoMedicinaState();
}

final medicinaRef = FirebaseDatabase.instance.reference().child('medicina');

class _InfoMedicinaState extends State<InfoMedicina> {
  List<Medicina> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Informacion'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        height: 500.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(children: [
              new Text(
                "Nombre: ${widget.medicina.nombre}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Clasificacion: ${widget.medicina.clasificacion}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Administracion: ${widget.medicina.administracion}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Tipo de Venta: ${widget.medicina.tipoVenta}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Compuestos: ${widget.medicina.compuestos}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Dosis: ${widget.medicina.dosis}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "contenido: ${widget.medicina.contenido}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Temperatura: ${widget.medicina.temperatura}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
            ]),
          ),
        ),
      ),
    );
  }
}
