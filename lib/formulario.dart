import 'package:practica2_ds/categoria.dart';

import 'accion.dart';

///Esta clase sirve para gestionar todos los procesos relacionados con los formularios
///y sirve como de "Clase mediadora" para tener una mayor abstracción y encapsulación
///También, tiene la variable global que guarda todos los formularios que se han ido creando
class GestorFormulario {
  List<Formulario> listaFormularios = []; //Variable global que guarda todos los formularios que se han ido creando

  ///SINGLETON PARA NO CREAR +1 INSTANCIA DEL GESTOR
  static final GestorFormulario _singleton = GestorFormulario._internal();
  factory GestorFormulario() {
    return _singleton;
  }
  GestorFormulario._internal();


  /// Método para crear un nuevo formulario con los parámetros que se recojan de la interfaz
  void crearFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto) {

    //Guardamos primero la fecha actual para que sea lo más cercana posible
    //al momento en el que el usuario pulsa el botón (porque hay procesamiento después)
    DateTime fecha = DateTime.now();

    //Comprobamos que el estado de ánimo es un int entre 1 y 5
    assert(estadoAnimo >= 1 && estadoAnimo <= 5);

    //Creamos una nueva instancia de formulario
    Formulario form = Formulario(estadoAnimo, listaCategorias, campoTexto, fecha);
    
    //Guardamos el formulario en la lista global de formularios
    listaFormularios.add(form);

    // todo pensar si poner aquí el mensaje de formulario creado correctamente

    print('Formulario creado correctamente'); //DEBUG
    mostrarFormularioTerminal(); //DEBUG
  }

  ///Este método sirve para debuggear y ver que se crean bien los formularios
  void mostrarFormularioTerminal(){
    Formulario form = listaFormularios.last;

    print(form._estadoAnimo);
    print(form._campoTexto);
    print(form._fecha);
  }

}


///Esta clase se encarga de definir los formularios que el usuario tiene que
///rellenar para completar su diario
class Formulario {

  late int _estadoAnimo; // tiene que ser un valor entre 1 y 5
  late List<Categoria> _listaCategorias = []; //Puede estar vacía
  late String _campoTexto;
  late DateTime _fecha;


  //Este constructor rellena todos los parámetros. Será una clase superior la que
  //determine qué y cómo se pasan los parámetros
  Formulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto, DateTime fecha){
    _estadoAnimo = estadoAnimo;
    _listaCategorias = listaCategorias;
    _campoTexto = campoTexto;
    _fecha = fecha;
  }

  //Este método permite modificar un formulario ya creado
  void modificarFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto){
    _estadoAnimo = estadoAnimo;
    _listaCategorias = listaCategorias;
    _campoTexto = campoTexto;
    // no se permite modificar la fecha, para que se quede guardada la original
  }
}