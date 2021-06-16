import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:temporatura_medicina/Screens/Login/components/background.dart';
import 'package:temporatura_medicina/Screens/Signup/signup_screen.dart';
import 'package:temporatura_medicina/components/already_have_an_account_acheck.dart';
import 'package:temporatura_medicina/components/rounded_button.dart';
import 'package:temporatura_medicina/components/rounded_input_field.dart';
import 'package:temporatura_medicina/components/rounded_password_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print('Usuario Registrado: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text('Ingresar'),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + buildSubmitButtons(),
            ),
          ),
        ));
  }

  List<Widget> buildInputs() {
    Size size = MediaQuery.of(context).size;

    return [
      SizedBox(height: size.height * 0.03),
      Image.asset(
        "assets/images/logo.png",
        width: size.width * 0.8,
      ),
      SizedBox(height: size.height * 0.03),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Correo Electrónico'),
        validator: (value) =>
            value.isEmpty ? 'Email no debe estar vacio' : null,
        onSaved: (value) => _email = value,
      ),
      SizedBox(height: size.height * 0.03),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Contraseña'),
        obscureText: true,
        validator: (value) =>
            value.isEmpty ? 'Contraseña no debe estar vacia' : null,
        onSaved: (value) => _password = value,
      ),
      SizedBox(height: size.height * 0.05),
    ];
  }

  List<Widget> buildSubmitButtons() {
    Size size = MediaQuery.of(context).size;

    if (_formType == FormType.login) {
      return [
        new ElevatedButton(
          child: new Text('Ingresar', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new TextButton(
          child: new Text('Crear una cuenta',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        new ElevatedButton(
          child: new Text('Crear una cuenta',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new TextButton(
          child:
              new Text('Ir a Ingresar', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
