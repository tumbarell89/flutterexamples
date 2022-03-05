import 'dart:async';

import 'package:solicitudes711/conexiones/servercontroller.dart';
import 'package:solicitudes711/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  ServerController server = ServerController();

  @override
  _LoginScreenState createState() => _LoginScreenState();

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String pass;
  Future<Post> post;
  String user;

  bool _cargando = false;
  GlobalKey _llave = GlobalKey<FormState>();
  Timer _timer;

  void _Acceder(BuildContext context) async {
    FormState form = _llave.currentState;
    if (form.validate()) {
      ServerController ser = new ServerController();
      form.save();
      if (_cargando == false) {
        setState(() {
          _cargando = true;
        });
        Post ppost = await ser.damedatos();

        print(user);
        print(pass);
        if (ppost != null) {
          post = ser.damedatos();
          _timer = Timer(const Duration(seconds: 2), _onShowHOme);
        }
      }
    }
  }

  void _onShowHOme() {
    Navigator.of(context).pushReplacement(HomeScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _llave,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[200], Colors.blue[800]])),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 400,
                  height: 500,
                  child: Card(
                    margin: const EdgeInsets.all(40),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              "assets/logo.png",
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Usuario"),
                            onSaved: (value) {
                              user = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Este campo es obligatorio";
                              }
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "Contraseña"),
                            obscureText: true,
                            onSaved: (value) {
                              pass = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Este campo es obligatorio";
                              }
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              _Acceder(context);
                            },
                          ),
                          if (_cargando)
                            CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
