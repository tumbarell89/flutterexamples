import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class ServerController {
  Future<Post> damedatos() async {
    final response =
        await http.get('http://plan711.local/restapi/v1/index.php/solicitudes');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      var pp = json.decode(response.body);
      //print(pp);
      return Post.fromJson(json.decode(response.body));
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      return Post.fromJson(json.decode("12"));
    }
  }

  Future<Post> damedLoguin(String user) async {
    final response =
        await http.get('http://plan711.local/restapi/v1/index.php/solicitudes');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //print(response.body);
      return Post.fromJson(json.decode(response.body));
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}

class Post {
  Post({this.error, this.cantidad, this.usuarios});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        error: json['error'],
        cantidad: json['cantidad'],
        usuarios: json['usuarios']);
  }

  final String cantidad;
  final bool error;
  final List<dynamic> usuarios;

  bool este() {
    return this.error;
  }
}

class Usuarios {
  Usuarios({this.idusuario, this.nombreusuario});

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
        idusuario: json['idusuario'], nombreusuario: json['nombreusuario']);
  }

  final String idusuario;
  final String nombreusuario;
}
