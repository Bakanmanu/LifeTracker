import 'package:flutter/material.dart';
import 'accion.dart';
import 'formulario.dart';

class Usuario {

  ///La Keyword 'late' sirve para indicar que los siguientes valores no se van a
  ///inicializar en tiempo de compilación, sino una vez se esté usando la app
  ///Es decir: si no se pone, las variables van a dar error porque van a ser
  ///nulas de primeras y tienen que inicializarse sí o sí. Otra forma es usar el
  ///operador '?', pero esto indicaría que las variables pueden ser nulas, y no
  ///queremos esto.
  late String _nombre, _apellidos, _username, _password;
  late int _ID;
  late List<Formulario> _listaFormularios;
  late List<Accion> _listaAcciones;

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