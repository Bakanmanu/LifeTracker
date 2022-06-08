import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:life_tracker/funcionalidad/formulario.dart';

/// Este fichero se encarga de gestionar las operaciones que se hacen a la API
/// para que las pueda usar la clase GestorFormulario
/// Así, lograremos cierta independencia si decidimos cambiar el sistema

/// Tener en cuenta:
/// Hay que pasar el ID del usuario correspondiente: con CurrentUser

class GestorFormularioAPI {

  // late int idForm;
  // late int idUser;
  // late DateTime date;
  // late String texto;
  // late int humor;
  // late List<bool> horasSueno      = [false,false,false,false,false];
  // late List<bool> calidadSueno    = [false,false,false,false,false];
  // late List<bool> autoestima      = [false,false,false,false,false];
  // late List<bool> productividad   = [false,false,false,false,false];
  // late List<bool> horasDeporte    = [false,false,false,false,false,false];
  // late List<bool> queHaceres      = [false,false,false,false,false,false,false];
  // late List<bool> comida          = [false,false,false,false,false,false,false];
  // late List<bool> entretenimiento = [false,false,false,false,false,false,false];
  // late List<bool> tiempo          = [false,false,false,false,false,false,false,false,false];
  //
  //
  //
  // /*
  //
  // * */
  //
  /// GESTIÓN DE LA API
  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS3_4/api/v1';

  // @override
  // String toString() {
  //   return /*"code: $code, */"id: $idUser, username: '$user', password: $pass";
  // }

  // Map<String, dynamic> toJson() => {
  //   'id': idUser,
  //   'username': user,  // /// Método para recuperar todos los formularios dado un user ID
//   // static Future<GestorFormularioAPI> getFormularios(int idUser) async {
//   //   final response = await http.get(
//   //     Uri.https(_baseAddress, '$_applicationName/usuarios/$idUser'),
//   //     headers: <String, String>{
//   //       'Content-Type': 'application/json; charset=UTF-8',
//   //     },
//   //   );
//   //   if (response.statusCode == 201) {
//   //     return GestorFormularioAPI.fromJson(jsonDecode(response.body));
//   //   } else {
//   //     throw Exception('Fallo al recuperar formularios');
//   //   }
//   // }
  //   'password': pass,
  // };

  // GestorFormularioAPI.fromJson(Map<String, dynamic> json)
  //     :
  //       idUser = json['id'],
  //       user = json['username'],
  //       pass = json['password'];



}