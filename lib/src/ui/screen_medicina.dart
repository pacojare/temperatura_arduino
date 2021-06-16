import 'package:flutter/material.dart';
import 'package:temporatura_medicina/src/model/medicina.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ScreenMedicina extends StatefulWidget {
  //ScreenPersona({Key key}) : super(key: key);

  final Medicina medicina;

  ScreenMedicina(this.medicina);

  @override
  _ScreenMedicinaState createState() => _ScreenMedicinaState();
}

final medicinaRef = FirebaseDatabase.instance.reference().child('medicina');
final Reference postImageRef = FirebaseStorage.instance.ref().child("Imagenes");

class _ScreenMedicinaState extends State<ScreenMedicina> {
  File sampleImage;
  final formKey = GlobalKey<FormState>();
  //final StorageReference postImageRef = FirebaseStorege.
  List<Medicina> items;

  TextEditingController nombreController;
  TextEditingController clasificacionController;
  TextEditingController administracionController;
  TextEditingController tipoVentaController;
  TextEditingController compuestosController;
  TextEditingController dosisController;
  TextEditingController contenidoController;
  TextEditingController temperaturaController;
  TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    nombreController = new TextEditingController(text: widget.medicina.nombre);
    clasificacionController =
        new TextEditingController(text: widget.medicina.clasificacion);
    administracionController =
        new TextEditingController(text: widget.medicina.administracion);
    tipoVentaController =
        new TextEditingController(text: widget.medicina.tipoVenta);
    compuestosController =
        new TextEditingController(text: widget.medicina.compuestos);
    dosisController = new TextEditingController(text: widget.medicina.dosis);
    contenidoController =
        new TextEditingController(text: widget.medicina.contenido);
    temperaturaController =
        new TextEditingController(text: widget.medicina.temperatura);
    statusController = new TextEditingController(text: widget.medicina.status);
  }

  Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(
              sampleImage,
              height: 300.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      sampleImage = tempImage;
    });
  }

  List<String> administracion = ["Oral", "Inyectado"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Registrar Medicina'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: sampleImage == null ? Text('') : enableUpload(),
                  width: 200,
                  color: Colors.blue[100],
                  height: 300,
                ),
                ElevatedButton(
                  child: Text('Foto'),
                  onPressed: getImage,
                ),
                TextField(
                  controller: nombreController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.menu_book), labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: clasificacionController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'clasificacion'),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: administracionController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.place), labelText: 'administracion'),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: tipoVentaController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.place),
                      labelText: 'Lugar de publicación'),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: compuestosController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      labelText: 'Fecha de emisión'),
                  keyboardType: TextInputType.datetime,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: dosisController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.money), labelText: 'dosis'),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: contenidoController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.check_box), labelText: 'Contenido'),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: temperaturaController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person_add), labelText: 'Prestamo'),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: statusController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.priority_high), labelText: 'Estatus'),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    if (widget.medicina.id != null) {
                      medicinaRef.child(widget.medicina.id).set({
                        'nombre': nombreController.text,
                        'clasificacion': clasificacionController.text,
                        'administracion': administracionController.text,
                        'tipoVenta': tipoVentaController.text,
                        'compuestos': compuestosController.text,
                        'dosis': dosisController.text,
                        'contenido': contenidoController.text,
                        'temperatura': temperaturaController.text,
                        'status': statusController.text,
                      }).then((_) => {Navigator.pop(context)});
                    } else {
                      medicinaRef.push().set({
                        'nombre': nombreController.text,
                        'clasificacion': clasificacionController.text,
                        'administracion': administracionController.text,
                        'tipoVenta': tipoVentaController.text,
                        'compuestos': compuestosController.text,
                        'dosis': dosisController.text,
                        'contenido': contenidoController.text,
                        'temperatura': temperaturaController.text,
                        'status': statusController.text,
                      }).then((_) => {Navigator.pop(context)});
                    }
                  },
                  child: (widget.medicina.id != null)
                      ? Text('Update')
                      : Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
