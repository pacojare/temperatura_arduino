import 'package:flutter/material.dart';
import 'package:temporatura_medicina/Screens/Login/components/background.dart';
import 'package:temporatura_medicina/Screens/Signup/signup_screen.dart';
import 'package:temporatura_medicina/components/already_have_an_account_acheck.dart';
import 'package:temporatura_medicina/components/rounded_button.dart';
import 'package:temporatura_medicina/components/rounded_input_field.dart';
import 'package:temporatura_medicina/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.8,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Correo Electrónico",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Ingresar",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
