import 'package:flutter/material.dart';
import 'package:temporatura_medicina/Screens/Login/components/body.dart';
import 'package:temporatura_medicina/auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
