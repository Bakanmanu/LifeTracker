import 'dart:convert';

import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:http/http.dart' as http;

/// Este fichero se encarga de gestionar las operaciones que se hacen a la API
/// para que las pueda usar la clase GestorUsuario
/// Así, lograremos cierta independencia si decidimos cambiar el sistema

class GestorUsuarioAPI {
  late int? code = 1;
  late int idUser;
  late String user;
  late String pass;

  /// GESTIÓN DE LA API
  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS3_4/api/v1';

  @override
  String toString() {
    return /*"code: $code, */"id: $idUser, username: '$user', password: $pass";
  }

  Map<String, dynamic> toJson() => {
        //'code': code,
        'id': idUser,
        'username': user,
        'password': pass,
      };

  GestorUsuarioAPI.fromJson(Map<String, dynamic> json)
      : code = 1,
        idUser = json['id'],
        user = json['username'],
        pass = json['password'];

  /// Método que devuelve el usuario creado al loguearse
  /// Este es el que tiene que llamar el Usuario para loguearse y le devuelve
  /// el objeto Usuario encontrado en BD
  /// Básicamente lo que hace es traducir la petición del método que llama API
  /// a un objeto Usuario comprensible por la App
  ///
  /// RETURNS: un usuario si el login es correcto; y un int que representa
  /// el código de error en caso contrario
  static dynamic iniciarSesionAPI(String user, String pass) {
    Future<GestorUsuarioAPI> future = _loginAPI(user, pass);

    future.then((pseudoUser) {
      switch (pseudoUser.code) {
        case 0: // usuario no existe
          return 0;
        case 1: // registro correcto
          return Usuario(pseudoUser.idUser, pseudoUser.user, pseudoUser.pass);

      // los siguientes métodos no deberían ser llamados nunca por control en la propia app
        case 2: // username incorrecto
          return 2;
        case 3: // password incorrecta
          return 3;
      }
    });
    return null;
  }

  /// Método que conecta con la API para loguearse con los parámetros pasados
  /// Es privado ya que funciona internamente
  static Future<GestorUsuarioAPI> _loginAPI(String user, String pass) async {

    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/usuarios/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': user, 'password': pass}),
    );
    if (response.statusCode == 201) {
      return GestorUsuarioAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al iniciar sesión');
    }
  }

  /// Método que devuelve el usuario creado al registrarse
  /// Este es el que tiene que llamar el Usuario para registrarse y le devuelve
  /// el objeto Usuario creado una vez se ha creado en la BD
  /// Básicamente lo que hace es traducir la petición del método que llama API
  ///
  /// RETURNS: un usuario si el registro es correcto; y un int que representa
  /// el código de error en caso contrario
  static dynamic registrarseAPI(String user, String pass) {

    Future<GestorUsuarioAPI> future = _registraseAPI(user, pass);

    future.then((pseudoUser) {
      switch (pseudoUser.code) {
        case 0: return 0; // usuario ya existe
        case 1:           // registro correcto
          return Usuario(pseudoUser.idUser, pseudoUser.user, pseudoUser.pass);
        case 2: return 2; // username incorrecto
        case 3: return 3; // password incorrecta
      }
    });
  }

  /// Método que conecta con la API para Registrarse con los parámetros pasados
  /// Es privado ya que funciona internamente
  static Future<GestorUsuarioAPI> _registraseAPI(String user, String pass) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/usuarios/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': user, 'password': pass}),
    );
    if (response.statusCode == 201) {
      return GestorUsuarioAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al crear el usuario');
    }
  }
}