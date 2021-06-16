import 'package:flutter/material.dart';
import 'package:temporatura_medicina/src/ui/list_view_medicina.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: ListViewMedicina(),
      ),
    );
  }
}
