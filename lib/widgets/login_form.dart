import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:prueba/utils/responsive.dart';
import 'package:prueba/widgets/Input_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey(); // que es esto

  //guardo mi email y pasword
  String _email = "", _password = "";
  _submit() {
    // lamo al form, verifico que todas las validaciones sean correctas
    final isOk = _formkey.currentState?.validate();
    print("dform isOk $isOk");
    if (isOk == true) {}
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.istablet ? 430 : 300),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              InputText(
                label: "email",
                keyboardType: TextInputType.emailAddress,
                fountsize: responsive.dp(1.6),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  text = "$text"; // no se que hice pero funciona
                  if (!text.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(children: <Widget>[
                  Expanded(
                    child: InputText(
                      label: "Password ",
                      obscureType: true,
                      borderEnabled: false,
                      fountsize: responsive.dp(1.6),
                      onChanged: (text) {
                        _password = text;
                      },
                      validator: (text) {
                        text = "$text"; // no se que hice pero funciona
                        if (text.trim().length == 0) {
                          //trim me borra los espacios
                          return "Invalid Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    //padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Forgort Paswword",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(1.6)),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    onPressed: () {},
                    child: Text(
                      "Forgort Paswword",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(1.6)),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: responsive.dp(5),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: _submit,
                  child: Text(
                    "Sign In ",
                    style: TextStyle(
                        color: Colors.white, fontSize: responsive.dp(1.6)),
                  ),
                  color: Colors.pink,
                ),
              ),
              SizedBox(
                height: responsive.dp(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New to friendly Desi ?",
                    style: TextStyle(fontSize: responsive.dp(1.6)),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text(
                        "Sign Up ",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: responsive.dp(1.6)),
                      ))
                ],
              ),
              SizedBox(
                height: responsive.dp(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
