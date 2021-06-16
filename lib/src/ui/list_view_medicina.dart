import 'dart:async';

import 'package:temporatura_medicina/src/ui/screen_medicina.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:temporatura_medicina/src/model/medicina.dart';
import 'package:temporatura_medicina/src/ui/informacion_medicina.dart';

class ListViewMedicina extends StatefulWidget {
  ListViewMedicina({Key key}) : super(key: key);

  @override
  _ListViewMedicinaState createState() => _ListViewMedicinaState();
}

//referencia a la tabla de firebase
final medicinaRef = FirebaseDatabase.instance.reference().child('medicina');

class _ListViewMedicinaState extends State<ListViewMedicina> {
  List<Medicina> items;
  StreamSubscription<Event> addMedicinas;
  StreamSubscription<Event> changeMedicinas;

  @override
  void initState() {
    super.initState();
    items = new List();
    addMedicinas = medicinaRef.onChildAdded.listen(_addMedicina);
    changeMedicinas = medicinaRef.onChildAdded.listen(_updateMedicina);
  }

  @override
  void dispose() {
    super.dispose();
    addMedicinas.cancel();
    changeMedicinas.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicinas Disponibles',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Medicinas Disponibles'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, position) {
              return Column(
                children: [
                  Divider(
                    height: 7.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[position].nombre}',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 21.0),
                          ),
                          subtitle: Text(
                            '${items[position].clasificacion}',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 21.0),
                          ),
                          leading: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 17.0,
                                child: Text(
                                  '${position + 1}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 21.0),
                                ),
                              )
                            ],
                          ),
                          onTap: () => infoMedicina(context, items[position]),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.purple,
                        ),
                        onPressed: () =>
                            borrarMedicina(context, items[position], position),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.red[300],
                        ),
                        onPressed: () => verMedicina(context, items[position]),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.black),
            backgroundColor: Colors.green,
            onPressed: () => agregarMedicina(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void _addMedicina(Event event) {
    setState(() {
      items.add(new Medicina.fromSnapShot(event.snapshot));
    });
  }

  void _updateMedicina(Event event) {
    var oldMedicina =
        items.singleWhere((medicina) => medicina.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMedicina)] =
          new Medicina.fromSnapShot(event.snapshot);
    });
  }

  void infoMedicina(BuildContext context, Medicina medicina) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMedicina(medicina),
        ));
  }

  void borrarMedicina(
      BuildContext context, Medicina medicina, int position) async {
    await medicinaRef.child(medicina.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void verMedicina(BuildContext context, Medicina medicina) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoMedicina(medicina),
        ));
  }

  void agregarMedicina(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMedicina(
              Medicina(null, '', '', '', '', '', '', '', '', '')),
        ));
  }
}
