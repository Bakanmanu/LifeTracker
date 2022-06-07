import 'dart:convert';

import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:http/http.dart' as http;

/// Este fichero se encarga de gestionar las operaciones que se hacen a la API
/// para que las pueda usar la clase GestorUsuario
/// Así, lograremos cierta independencia si decidimos cambiar el sistema

class GestorUsuarioAPI {

  late int code;
  late int idUser;
  late String user;
  late String pass;

  /// GESTIÓN DE LA API
  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS3_4/api/v1/';

  @override
  String toString() {
    return "code: $code, id: $idUser, user: '$user', pass: $pass";
  }

  Map<String, dynamic> toJson() => {'code': code, 'id': idUser, 'user': user, 'pass': pass,};

  GestorUsuarioAPI.fromJson(Map<String, dynamic> json)
      :
        code    = json['code'],
        idUser  = json['id'],
        user    = json['user'],
        pass    = json['pass'];

  // /// Método que conecta con la API para Iniciar Sesión con los parámetros pasados
  // static Future<Usuario> iniciarSesionAPI(String user, String pass) async {
  //   // Hacer algún método que cree el usuario que se le va a devolver al
  //   // GestorUsuario
  // }


  /// Método que devuelve el usuario creado al registrarse
  /// Este es el que tiene que llamar el Usuario para registrarse y le devuelve
  /// el objeto Usuario creado una vez se ha creado en la BD
  /// Básicamente lo que hace es traducir la petición del método que llama API
  static Usuario? registrarseAPI(String user, String pass){
    Future<GestorUsuarioAPI> future = _registraseAPI(user, pass);

    Usuario? usuario;

    future.then((pseudoUser){
      return usuario = Usuario(pseudoUser.idUser, pseudoUser.user, pseudoUser.pass);
    });

    return usuario;
  }

  /// Método que conecta con la API para Registrarse con los parámetros pasados
  /// Es privado ya que funciona internamente
  static Future<GestorUsuarioAPI> _registraseAPI(String user, String pass) async {
    // aquí hay que poner el id al user
    // Hacer algún método que cree el usuario que se le va a devolver al
    // GestorUsuario

    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/usuarios/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user': user,
        'pass': pass
      }),
    );
    if (response.statusCode == 201) {
      return GestorUsuarioAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al crear el usuario');
    }
  }
}