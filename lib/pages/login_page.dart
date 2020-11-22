import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_flutter/pages/groups_page.dart';
import 'package:rest_flutter/rest_api/provider/user_provider.dart';
import 'package:rest_flutter/utils/user_preference.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var buttonSending = false;

  @override
  Widget build(BuildContext context) {
    userController.text = "admin@gmail.com";
    passwordController.text = "PepeLePew7";

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: _form(context),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Card(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Column(
                children: [
                  _userField(),
                  SizedBox(
                    height: 15,
                  ),
                  _passwordField(),
                  SizedBox(
                    height: 15,
                  ),
                  _sendDataFormButton(context)
                ],
              ),
            ),
          )),
    );
  }

  Widget _userField() {
    return TextFormField(
      maxLength: 20,
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar algun valor";
        }
        return null;
      },
      controller: userController,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Usuario'),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      maxLength: 20,
      validator: (value) {
        if (value.isEmpty) {
          return "Tienes que colocar algun valor";
        }
        return null;
      },
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: 'Contraseña'),
    );
  }

  Widget _sendDataFormButton(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: buttonSending
          ? null
          : () async {
              if (_formKey.currentState.validate()) {
                // login

                setState(() {
                  buttonSending = true;
                });

                final token = await UserProvider.login(
                    userController.text, passwordController.text);

                setState(() {
                  buttonSending = false;
                });

                if (token != null) {
                  final userPreference = UserPreference();
                  userPreference.token = token;

                  Navigator.pushReplacementNamed(context, GroupsPage.ROUTE);
                } else {
                  Alert(
                          context: context,
                          title: "Error",
                          desc: "Usuario y/o contraseña inválido")
                      .show();
                }
              } else {
                print("Problemas en el form");
              }
            },
      child: Container(
        width: double.infinity,
        child: Text(
          "Enviar",
          style: TextStyle(fontSize: 17.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
    );
  }
}
