//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:prueba/utils/responsive.dart';
import 'package:prueba/widgets/circle.dart';
import 'package:prueba/widgets/icon_container.dart';

class RegisterPage extends StatefulWidget {
  //buenas practicas
  static const routename = 'register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    top: -pinksize * 0.3,
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
                    top: -(orangesize) * 0.45,
                    left: -(orangesize) * 0.15,
                    child: Circle(
                      size: orangesize,
                      colors: [
                        Colors.orange,
                        Colors.deepOrangeAccent,
                      ],
                    )),
                Positioned(
                    top: pinksize * 0.22,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Hello \n Sign Up to get Statrted",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: responsive.dp(1.6),
                              color: Colors.white),
                        ),
                        SizedBox(height: responsive.dp(4.5)),
                        ClipOval(
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/29339422?v=4',
                            width: responsive.wp(25),
                            height: responsive.wp(25),
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  left: 15,
                  top: 15,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.black26,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(40),
                      child: Icon(Icons.arrow_back_outlined),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
