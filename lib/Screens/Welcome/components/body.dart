import 'package:flutter/material.dart';
import 'package:temporatura_medicina/constants.dart';
import 'background.dart';
import 'package:temporatura_medicina/Screens/Login/login_screen.dart';
import 'package:temporatura_medicina/Screens/Signup/signup_screen.dart';
import 'package:temporatura_medicina/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.8,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Ingresar",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Registrarse",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
