
import 'package:practica2_ds/funcionalidad/formulario.dart';

/// Clase que define toda la funcionalidad respecto a un usuario. Por ejemplo,
/// aquí se guardarán todos los formularios y categorías que éste cree, además
/// de servir como identificador a la hora de subir información a la BD

class Usuario { // todo habría que añadir un apartado para crear usuario o preguntar al iniciar
  /// Atributos
  late String user; // Pensar si hay que comprobar en la base de datos que exista ese nombre
  late String pass; // ¿?
  late GestorFormulario gestorFormulario; // todo pensar si se necesita o si hay que hacer los mismos atributos
                                          // también pensar si habría que sacar la lista de formularios de esta clase y ponerla en user

  // Lista de categorías --> pensar si hay que diferenciar entre las default (o ver si las default se cargan en otro lado
  // o también hay que diferenciar las que creas y las que te descargas

  // Tal vez una ID de usuario única que le identifique pero que se lo devuelva la base de datos

  // todo pensar más posibles métodos
}