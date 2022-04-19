//import 'dart:html';

import 'package:practica2_ds/usuario.dart';
import 'accion.dart';

class Formulario {

  ///La Keyword 'late' sirve para indicar que los siguientes valores no se van a
  ///inicializar en tiempo de compilación, sino una vez se esté usando la app
  ///Es decir: si no se pone, las variables van a dar error porque van a ser
  ///nulas de primeras y tienen que inicializarse sí o sí. Otra forma es usar el
  ///operador '?', pero esto indicaría que las variables pueden ser nulas, y no
  ///queremos esto.
  late int _estadoAnimo; // tiene que ser un valor entre 1 y 5
  late List<Accion> _listaAcciones;
  late String _campoTexto;
  late DateTime _fecha;
  late Usuario _user;

  //todo Hay que hacer otro constructor para por si la fecha se quiere poner explícitamente
  Formulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto, Usuario user){
    _estadoAnimo = estadoAnimo;
    _listaAcciones = listaAcciones;
    _campoTexto = campoTexto;
    _fecha = DateTime.now(); // Obtiene la fecha en el momento de creación
    _user = user;
  }

  ///Este método permite modificar un formulario ya creado
  void modificarFormulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto, DateTime fecha){
    _estadoAnimo = estadoAnimo;
    _listaAcciones = listaAcciones;
    _campoTexto = campoTexto;
    _fecha = fecha; // Obtiene la fecha en el momento de creación
  }


}