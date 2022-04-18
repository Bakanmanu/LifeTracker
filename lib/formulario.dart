//import 'dart:html';

import 'package:practica2_ds/usuario.dart';
import 'accion.dart';

class Formulario {

  int _estadoAnimo; // tiene que ser un valor entre 1 y 5
  List<Accion> _listaAcciones;
  String _campoTexto;
  DateTime _fecha;
  Usuario _user;

  //todo Hay que hacer otro constructor para por si la fecha se quiere poner explícitamente
  Formulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto, Usuario user){
    _estadoAnimo = estadoAnimo;
    _listaAcciones = listaAcciones;
    _campoTexto = campoTexto;
    _fecha = DateTime.now(); // Obtiene la fecha en el momento de creación
    _user = user;
  }


}