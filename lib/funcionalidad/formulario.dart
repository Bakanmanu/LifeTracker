import './accion.dart';
import 'categoria.dart';
import 'formato_fecha.dart';

///Esta clase sirve para gestionar todos los procesos relacionados con los formularios
///y sirve como de "Clase mediadora" para tener una mayor abstracción y encapsulación
///También, tiene la variable global que guarda todos los formularios que se han ido creando
class GestorFormulario {

  // todo ver si hay que guardar los formularios de la BD en listaFormularios
  List<Formulario> listaFormularios = []; //Variable global que guarda todos los formularios que se han ido creando
  late int indexFormEditar; //esta variable guarda el indice del formulario que se desea editar
  bool isModificar = false; // variable que nos va a servir para elegir la estrategia al rellenar un formulario: crear o modificar

  //List<Categoria> categoriasDLC = []; // Lista que contiene las categorías que se vayan descargando //DEPRECATED


  /// Método para crear un nuevo formulario con los parámetros que se recojan de la interfaz
  void crearFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto) {

    //Guardamos primero la fecha actual para que sea lo más cercana posible
    //al momento en el que el usuario pulsa el botón (porque hay procesamiento después)
    DateTime fecha = DateTime.now();

    //Comprobamos que el estado de ánimo es un int entre 1 y 5
    assert(estadoAnimo >= 1 && estadoAnimo <= 5);

    //Guardamos las acciones seleccionadas en la lista "respuestas" de categoría
    for(Categoria cat in listaCategorias){
      cat.actualizarRespuestas(); //todo revisar dónde se actualizan las respuestas
    }

    //Creamos una nueva instancia de formulario
    Formulario form = Formulario(estadoAnimo, listaCategorias, campoTexto, fecha);
    
    //Guardamos el formulario AL PRINCIPIO lista global de formularios
    //todo revisar API: hacer que se suba a la BD, y cuando se valide la operación, se guarde en la listaFormularios
    // para hacer como si se guardara en paralelo y no tocar mucha funcionalidad
    listaFormularios.insert(0, form);
  }

  ///Método que edita el formulario
  /// todo revisar API
  void editarFormulario(int estadoAnimo, List<Categoria> listaCategorias, String campoTexto){
    listaFormularios[indexFormEditar].modificarFormulario(estadoAnimo, listaCategorias, campoTexto);
  }

  ///Borra el formulario que se le pasa por parámetro
  /// todo revisar API
  void borrarFormulario(Formulario form){
    listaFormularios.remove(form);
  }

  ///Pone el valor de índice en pantallaMostrarFormulario cuando se pulsa
  ///la opción de editar
  void setIndex(int index){
    indexFormEditar = index;
  }


  /// Devuelve el número de formularios que hay
  int getNumeroFormularios(){
    return listaFormularios.length;
  }

  ///Devuelve el formulario correspondiente al índice en la lista de formularios
  Formulario getFormByIndex(int index){
    return listaFormularios[index]; // todo ver si esto hay que hacerlo en la lista del Usuario
  }

  /// Método que ha de ser llamado para crear un formulario nuevo
  void setStratCrear() => isModificar = false;

  /// Método que ha de ser llamado para modificar un formulario existente
  void setStratModificar() => isModificar = true;

  /// Devuelve el formulario que se va a editar
  Formulario getFormEditar(){
      return listaFormularios[indexFormEditar];
  }

  /// Devuelve un string con lista de acciones == true del formulario dado
  String getRespuestasAcciones(Formulario form){
    String respuestas = '';
    for(Categoria cat in form.listaCategorias){

      // Hemos considerado que no hace falta poner la categoría si no tiene
      // ninguna acción marcada

      if (cat.respuestas.isEmpty){ // si no hay respuestas, ponemos una raya
        //respuestas += '-\n';
      }
      else { //si hay respuestas, las ponemos

        //IMPRIMIMOS TÍTULO DE CATEGORÍA
        respuestas += "→" + cat.enunciado + '\n';

        for(Accion acc in cat.respuestas){
          respuestas += acc.nombre; //TÍTULO DE RESPUESTA
          if(acc == cat.respuestas.last){/*nada*/} //si es el último elemento no añadimos nada
          else {respuestas += " / ";} //ponemos una barra para separar si no es el último
        }
        respuestas += '\n━━━━━━━━\n'; //ponemos barra separadora en caso de haber respuestas
      }
    }

    if (respuestas == ''){ // Si se han dejado las categorías vacías
      respuestas = 'No se ha marcado ninguna acción 😬';
    }

    return respuestas;
  }

  /// Devuelve la fecha en formato legible del formulario pasado por parámetro
  String getFechaFormat(Formulario form){
    return FormatoFecha.getFecha_es_ddmmyyyy_hhmm(form.fecha);
  }

  /// Este método devuelve todas las categorías que haya (DEFAULT + DLC)
  List<Categoria> generateCategorias(){
    List<Categoria> lista = crearCategoriasDefault();
    //lista += crearCategoriasDLC(); // DEPRECATED
    //lista += categoriasDLC; // metemos las que ya estaban DEPRECATED
    return lista;
  }

  /// Este método sirve para inicializar una tanda de categorías y acciones predeterminadas
  List<Categoria> crearCategoriasDefault(){
    return [
      Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
        Accion(0, "0 horas", false),
        Accion(1, "1-3 horas", false),
        Accion(2, "4-6 horas", false),
        Accion(3, "7-8 horas", false),
        Accion(4, "+8 horas", false),
      ]),
      Categoria(enunciado: 'Calidad del sueño', acciones: [
        Accion(0, "Insomnio", false),
        Accion(1, "Mala", false),
        Accion(2, "Neutral", false),
        Accion(3, "Buena", false),
        Accion(4, "Dormir acompañado", false),
      ]),
      Categoria(enunciado: 'Autoestima', acciones: [
        Accion(1, "Muy baja", false),
        Accion(2, "Baja", false),
        Accion(3, "Neutral", false),
        Accion(4, "Alta", false),
        Accion(5, "Muy alta", false),
      ]),
      Categoria(enunciado: 'Productividad', acciones: [
        Accion(1, "Muy baja", false),
        Accion(2, "Baja", false),
        Accion(3, "Neutral", false),
        Accion(4, "Alta", false),
        Accion(5, "Muy alta", false),
      ]),
      Categoria(enunciado: '¿Cuánto deporte has hecho?', acciones: [
        Accion(0, "0h", false),
        Accion(1, "0.5h", false),
        Accion(2, "1h", false),
        Accion(3, "1.5h", false),
        Accion(4, "2h", false),
        Accion(5, "+2h", false),
      ],),
      Categoria(enunciado: 'Quehaceres', acciones: [
        Accion(0, "Hacer la compra", false),
        Accion(1, "Hacer la colada", false),
        Accion(2, "Hacer la comida", false),
        Accion(3, "Limpiar el cuarto", false),
        Accion(4, "Barrer la casa", false),
        Accion(5, "Lavar los platos", false),
        Accion(6, "Lavar el coche", false),
      ]),
      Categoria(enunciado: '¿Qué has comido?', acciones: [
        Accion(0, "Fruta", false),
        Accion(1, "Verdura", false),
        Accion(2, "Carne", false),
        Accion(3, "Pescao", false),
        Accion(4, "Lácteos", false),
        Accion(5, "Pasta", false),
        Accion(6, "Arroz", false)
      ]),
      Categoria(enunciado: 'Entretenimiento', acciones: [
        Accion(0, "Echar la siesta", false),
        Accion(1, "Comer con amigos", false),
        Accion(2, "Salir de fiesta", false),
        Accion(3, "Ver una peli/serie", false),
        Accion(4, "Jugar videojuegos", false),
        Accion(5, "Tocar un instrumento", false),
        Accion(6, "Ir de viaje", false)
      ]),
      Categoria(enunciado: '¿Qué tiempo hace?', acciones: [
        Accion(0, "Soleado", false),
        Accion(1, "Nublado", false),
        Accion(2, "Lluvia", false),
        Accion(3, "Nieve", false),
        Accion(4, "Granizo", false),
        Accion(5, "Tormenta", false),
        Accion(6, "Calima", false),
        Accion(7, "Frío", false),
        Accion(8, "Calor", false),
      ],),
    ];
  }

  /// Método para añadir packs de categorías descargados
  /// DEPRECATED hasta añadir la funcionalidad de descargar Categorías
  void anadirCategoriasDLC(List <Categoria> lista){
    // for (Categoria cat in lista){
    //   categoriasDLC.add(cat); // descomentar el atributo categoriasDLC
    // }
  }

  /// Método de prueba para cargar las categorías DLC
  /// DEPRECATED
  //ESTE MÉTODO AÚN NO SE PUEDE IMPLEMENTAR. Esperar a aplicación web
  List<Categoria> crearCategoriasDLC(){
    // La idea es que este método obtenga de alguna manera una categoría descargada
    return [];
  }

  ///Este método sirve para debuggear y ver que se crean bien los formularios
  // void mostrarFormularioTerminal(){
  //   Formulario form = listaFormularios.last;
  //
  //   print(form._estadoAnimo);
  //   print(form._campoTexto);
  //
  //   print('ACCIÓN + BOOL:');
  //   for (Categoria cat in form._listaCategorias){
  //     print('CATEGORÍA: ' + cat.enunciado);
  //     for (Accion acc in cat.acciones){
  //       acc.activo ? print(acc.nombre + ": TRUE") : print(acc.nombre + ": FALSE");
  //     }
  //   }
  //   print('ACCIONES ACTIVAS:');
  //   for (Categoria cat in form._listaCategorias){
  //     print('CATEGORÍA: ' + cat.enunciado);
  //     for (Accion acc in cat.respuestas){
  //       print(acc.nombre);
  //     }
  //   }
  //   print(form._fecha);
  // }

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