//import 'dart:html';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:prueba/utils/responsive.dart';
import 'package:prueba/widgets/circle.dart';
import 'package:prueba/widgets/icon_container.dart';
import 'package:prueba/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  //buenas practicas
  static const routename = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    //    final Size size = MediaQuery.of(context).size;
    final double orangesize = responsive.wp(57);
    final double pinksize = responsive.wp(80);
    // lo mismo puedo hacer con pink

    return Scaffold(
      body: GestureDetector(
        //´para ocultar el teclado
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          // tendremos porblemas con la altura ya qu ees dinamica, por eso usamosel responsive
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: -pinksize * 0.5,
                    right: -pinksize * 0.2,
                    child: Circle(
                      size: pinksize,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Colors.pink,
                        Color.fromARGB(255, 243, 159, 187),
                      ],
                    )),
                Positioned(
                    top: -(orangesize) * 0.55,
                    left: -(orangesize) * 0.15,
                    child: Circle(
                      size: orangesize,
                      colors: [
                        Colors.orange,
                        Colors.deepOrangeAccent,
                      ],
                    )),
                Positioned(
                    top: pinksize * 0.35,
                    child: Column(
                      children: <Widget>[
                        IconContainer(size: responsive.wp(17)),
                        SizedBox(
                          height: responsive.dp(3),
                        ),
                        Text(
                          "Hello melanie\nWelcome Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: responsive.dp(1.6)),
                        )
                      ],
                    )),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
