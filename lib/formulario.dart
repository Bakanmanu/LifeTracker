import 'package:practica2_ds/categoria.dart';

import 'accion.dart';

///Esta clase sirve para gestionar todos los procesos relacionados con los formularios
///y sirve como de "Clase mediadora" para tener una mayor abstracción y encapsulación
///También, tiene la variable global que guarda todos los formularios que se han ido creando
class GestorFormulario {
  List<Formulario> listaFormularios = []; //Variable global que guarda todos los formularios que se han ido creando
  //Esta variable es late porque sólo se va a usar si se edita un formulario
  late int indexFormEditar; //esta variable guarda el indice del formulario que se desea editar

  ///SINGLETON PARA NO CREAR MÁS DE 1 INSTANCIA DEL GESTOR
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

    //Guardamos las acciones seleccionadas en la lista "respuestas" de categoría
    for(Categoria cat in listaCategorias){
      for (Accion acc in cat.acciones){
        if (acc.activo) { // si la acción está seleccionada
          cat.anadirRespuesta(acc); //añadimos la acción activa a la lista de respuestas
        }
      }
    }

    //Creamos una nueva instancia de formulario
    Formulario form = Formulario(estadoAnimo, listaCategorias, campoTexto, fecha);
    
    //Guardamos el formulario en la lista global de formularios
    listaFormularios.add(form);

    print('Formulario creado correctamente'); //DEBUG
    mostrarFormularioTerminal(); //DEBUG
  }

  ///Método que edita el formulario
  void editarFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto){
    listaFormularios[indexFormEditar].modificarFormulario(estadoAnimo, listaCategorias, campoTexto);
  }

  ///Borra el formulario que se le pasa por parámetro
  void borrarFormulario(Formulario form){
    listaFormularios.remove(form);
  }

  ///Pone el valor de índice en pantallaMostrarFormulario cuando se pulsa
  ///la opción de editar
  void setIndex(int index){
    indexFormEditar = index;
  }

  ///Devuelve el formulario correspondiente al índice en la lista de formularios
  Formulario getFormByIndex(int index){
    return listaFormularios[index];
  }

  /// Devuelve el formulario que se va a editar
  Formulario getFormEditar(){
      return listaFormularios[indexFormEditar];
  }


  ///Este método sirve para debuggear y ver que se crean bien los formularios
  void mostrarFormularioTerminal(){
    Formulario form = listaFormularios.last;

    print(form._estadoAnimo);
    print(form._campoTexto);

    print('ACCIÓN + BOOL:');
    for (Categoria cat in form._listaCategorias){
      print('CATEGORÍA: ' + cat.enunciado);
      for (Accion acc in cat.acciones){
        acc.activo ? print(acc.nombre + ": TRUE") : print(acc.nombre + ": FALSE");
      }
    }
    print('ACCIONES ACTIVAS:');
    for (Categoria cat in form._listaCategorias){
      print('CATEGORÍA: ' + cat.enunciado);
      for (Accion acc in cat.respuestas){
        print(acc.nombre);
      }
    }
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

  ///Este método permite modificar un formulario ya creado
  void modificarFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto){
    _estadoAnimo = estadoAnimo;
    _listaCategorias = listaCategorias;
    _campoTexto = campoTexto;
    // no se permite modificar la fecha, para que se quede guardada la original
  }

  String get campoTexto => _campoTexto;
  int get estadoAnimo => _estadoAnimo;
  List<Categoria> get listaCategorias => _listaCategorias;
  DateTime get fecha => _fecha;
}