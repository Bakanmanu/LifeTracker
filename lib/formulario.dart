import 'package:practica2_ds/categoria.dart';

import 'accion.dart';

///Esta clase sirve para gestionar todos los procesos relacionados con los formularios
///y sirve como de "Clase mediadora" para tener una mayor abstracción y encapsulación
///También, tiene la variable global que guarda todos los formularios que se han ido creando
class GestorFormulario {
  List<Formulario> listaFormularios = []; //Variable global que guarda todos los formularios que se han ido creando
  //Esta variable es late porque sólo se va a usar si se edita un formulario
  late int indexFormEditar; //esta variable guarda el indice del formulario que se desea editar

  ///SINGLETON v2 PARA NO CREAR MÁS DE 1 INSTANCIA DEL GESTOR
  GestorFormulario._privateConstructor();
  static final GestorFormulario _instance = GestorFormulario._privateConstructor();
  static GestorFormulario get instance => _instance;


  /// Método para crear un nuevo formulario con los parámetros que se recojan de la interfaz
  void crearFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto) {

    //Guardamos primero la fecha actual para que sea lo más cercana posible
    //al momento en el que el usuario pulsa el botón (porque hay procesamiento después)
    DateTime fecha = DateTime.now();

    //Comprobamos que el estado de ánimo es un int entre 1 y 5
    assert(estadoAnimo >= 1 && estadoAnimo <= 5);

    //Guardamos las acciones seleccionadas en la lista "respuestas" de categoría
    for(Categoria cat in listaCategorias){
      cat.actualizarRespuestas();
    }

    //Creamos una nueva instancia de formulario
    Formulario form = Formulario(estadoAnimo, listaCategorias, campoTexto, fecha);
    
    //Guardamos el formulario AL PRINCIPIO lista global de formularios
    listaFormularios.insert(0, form);

    //print('Formulario creado correctamente'); //DEBUG
    //mostrarFormularioTerminal(); //DEBUG
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

  /// Devuelve un string con lista de acciones == true del formulario dado
  String getRespuestasAcciones(Formulario form){
    String respuestas = '';
    for(Categoria cat in form.listaCategorias){

      //IMPRIMIMOS TÍTULO DE CATEGORÍA
      respuestas += "→" + cat.enunciado + '\n';

      if (cat.respuestas.isEmpty){ // si no hay respuestas, ponemos una raya
        respuestas += '-\n';
      } else { //si hay respuestas, las ponemos
        for(Accion acc in cat.respuestas){
          respuestas += acc.nombre; //PONEMOS TÍTULO DE RESPUESTA
          if(acc == cat.respuestas.last){/*nada*/} //si es el último elemento no añadimos nada
          else {respuestas += " / ";} //ponemos una barra para separar si no es el último
        }
        respuestas += '\n━━━━━━━━\n'; //ponemos barra separadora en caso de haber respuestas
      }
    }
    return respuestas;
  }


  ///Este método sirve para inicializar una tanda de categorías y acciones predeterminadas
  List<Categoria> crearCategoriasDefault(){
    return [
      Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
        Accion("1-3 horas", false),
        Accion("4-6 horas", false),
        Accion("6-8 horas", false),
        Accion("más de 8 horas", false)
      ]),
      Categoria(enunciado: '¿Qué has comido?', acciones: [
        Accion("fruta", false),
        Accion("verdura", false),
        Accion("carne", false),
        Accion("pollo", false),
        Accion("pasta", false)
      ]),
      Categoria(enunciado: '¿Qué has hecho?', acciones: [
        Accion("tocar la guitarra", false),
        Accion("salir a correr", false),
        Accion("ir al gimnasio", false),
        Accion("echar la siesta", false),
        Accion("comer con amigos", false),
        Accion("hacer la colada", false)
      ]),
    ];
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



/// *************CLASE FORMULARIO*******************************************
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
    //Actualizamos las acciones que se hayan podido
    for (Categoria cat in listaCategorias){
      cat.actualizarRespuestas();
    }
    _estadoAnimo = estadoAnimo;
    _listaCategorias = listaCategorias;
    _campoTexto = campoTexto;
    // no se permite modificar la fecha, para que se quede guardada la original

  }

  /// GETTERS
  String get campoTexto => _campoTexto;
  int get estadoAnimo => _estadoAnimo;
  List<Categoria> get listaCategorias => _listaCategorias;
  DateTime get fecha => _fecha;
}