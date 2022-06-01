import 'package:life_tracker/funcionalidad/estadisticas.dart';

/// Esta clase se encarga de gestionar todas las posibles
/// acciones que podría tener una categoría.
/// El atributo value hace referencia a un valor tangible
/// que será útil para calcular la media (ver [Estadisticas]
///
/// Por ejemplo, para la categoría ¿Cuánto has dormido?, la
/// acción correspondiente a 1-3 horas tendrá un value de 2
class Accion {
  int value;
  String nombre;
  bool activo = false;

  //Constructor
  Accion(this.value, this.nombre, this.activo);

  //Método para crear una acción públicamente usando el constructor
  Accion crearAccion(String nombre){
    return Accion(value, nombre, activo);
  }

  Accion modificarAccion(String nom){
    nombre = nom;
    return this;
  }

  void cambiarActivo(){
    activo = !activo;
  }
}