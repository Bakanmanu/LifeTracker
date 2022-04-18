import 'package:flutter/material.dart';
import 'accion.dart';
import 'formulario.dart';

class Usuario {
  String? _nombre, _apellidos, _username, _password; //todo quitar el nullable ("?")
  int? _ID; //todo quitar el nullable ("?")
  List<Formulario>? _listaFormularios; //todo quitar el nullable ("?")
  List<Accion>? _listaAcciones; //todo quitar el nullable ("?")

  //todo hacer un método que cree un usuario como si fuera un registro tiene que ser un método externo
  //Constructor
  Usuario(nombre, apellidos, username, password){
    _nombre = nombre;
    _apellidos = apellidos;
    _username = username;
    _password = password;
    _ID = 0;  // todo crear un secuenciador
    _listaFormularios; // todo rellenar
    _listaAcciones; // todo rellenar
  }


}