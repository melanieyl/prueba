import 'package:flutter/material.dart';
import 'package:prueba/pages/login_pages.dart';
// para que no roten mis pantallas
import 'package:flutter/services.dart';
import 'package:prueba/pages/register_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //para que no rote mis pantallas
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        RegisterPage.routename: (_) => RegisterPage(),
        LoginPage.routename: (_) => RegisterPage(),
      },
    );
  }
}
