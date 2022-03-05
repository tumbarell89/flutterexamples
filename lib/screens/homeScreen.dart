import 'package:solicitudes711/conexiones/servercontroller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
    );
  }

  ServerController server = ServerController();
  //final String mensaje = "23";
  Future<Post> post;

  //const HomeScreen() : super(key: key);
  //const HomeScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    post = server.damedatos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  print(snapshot);
                  /*for (var i = 0; i < snapshot.data.usuarios.length; i++) {
                    //Text(snapshot.data.usuarios[i].idusuario);
                  }*/

                  // Por defecto, muestra un loading spinner
                  //return CircularProgressIndicator();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
