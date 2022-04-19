import 'accion.dart';

///Esta clase sirve para gestionar todos los procesos relacionados con los formularios
///y sirve como de "Clase mediadora" para tener una mayor abstracción y encapsulación
///También, tiene la variable global que guarda todos los formularios que se
///han ido creando
class GestorFormulario {
  List<Formulario> listaFormularios = []; //Variable global que guarda todos los formularios que se han ido creando

  ///Método para crear un nuevo formulario con los parámetros que se recojan de la interfaz
  Formulario crearFormulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto) {

    ///Guardamos primero la fecha actual para que sea lo más cercana posible
    ///al momento en el que el usuario pulsa el botón (porque hay procesamiento después)
    DateTime fecha = DateTime.now();

    ///Comprobamos que el estado de ánimo es un int entre 1 y 5
    assert(estadoAnimo >= 1 && estadoAnimo <= 5);

    ///Filtramos las acciones para guardar solo las que sean true
    List<Accion> listaAccionesFiltrada = []; //Puede estar vacía
    for (var accion in listaAcciones) {
      if (accion.activo){
        listaAccionesFiltrada.add(accion); //Metemos la acción si se encuentra activada
      }
    }

    ///Creamos una nueva instancia de formulario
    Formulario form = Formulario(estadoAnimo, listaAccionesFiltrada, campoTexto, fecha);
    
    ///Guardamos el formulario en la lista global de formularios
    listaFormularios.add(form);

    //ToDo Revisar si hace falta realmente devolver el formulario por si lo necesita alguna clase más o se puede hacer un void
    return form;
  }
}


///Esta clase se encarga de definir los formularios que el usuario tiene que
///rellenar para completar su diario
class Formulario {
  ///La Keyword 'late' sirve para indicar que los siguientes valores no se van a
  ///inicializar en tiempo de compilación, sino una vez se esté usando la app
  ///Es decir: si no se pone, las variables van a dar error porque van a ser
  ///nulas de primeras y tienen que inicializarse sí o sí. Otra forma es usar el
  ///operador '?', pero esto indicaría que las variables pueden ser nulas, y no
  ///queremos esto.
  late int _estadoAnimo; // tiene que ser un valor entre 1 y 5
  late List<Accion> _listaAcciones = []; //Puede estar vacía
  late String _campoTexto;
  late DateTime _fecha;


  ///Este constructor rellena todos los parámetros. Será una clase superior la que
  ///determine qué y cómo se pasan los parámetros
  Formulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto, DateTime fecha){
    _estadoAnimo = estadoAnimo;
    _listaAcciones = listaAcciones;
    _campoTexto = campoTexto;
    _fecha = fecha;
  }

  ///Este método permite modificar un formulario ya creado
  void modificarFormulario(int estadoAnimo, List<Accion> listaAcciones, String campoTexto, DateTime fecha){
    _estadoAnimo = estadoAnimo;
    _listaAcciones = listaAcciones;
    _campoTexto = campoTexto;
    _fecha = fecha; // Obtiene la fecha en el momento de creación
  }
}