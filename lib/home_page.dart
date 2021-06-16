import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:temporatura_medicina/src/ui/list_view_medicina.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Bienvenido'),
          actions: <Widget>[
            new TextButton(
              child: new Text('Logout',
                  style: TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut,
            ),
          ],
        ),
        body: new MaterialApp(
          home: Center(
            child: ListViewMedicina(),
          ),
        ));
  }
}
