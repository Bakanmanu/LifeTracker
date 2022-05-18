import 'categoria.dart';
import 'formulario.dart';

/// Clase que define toda la funcionalidad respecto a un usuario. Por ejemplo,
/// aquí se guardarán todos los formularios y categorías que éste cree, además
/// de servir como identificador a la hora de subir información a la BD

class Usuario { // todo habría que añadir un apartado para crear usuario o preguntar al iniciar
  /// Atributos
  late String user; // Pensar si hay que comprobar en la base de datos que exista ese nombre
  late String pass; // ¿?
  late int userID;  // todo revisar si es necesario

  List<Categoria> categoriasDLC = [];     // Lista que contiene las categorías que se vayan descargando todo pensar si hay que diferenciar de las default
  late GestorFormulario gestorFormulario;



  //Método para que devuelva el gestor y/o métodos del gestor  --> editar o nuevo formulario

  // todo pensar más posibles métodos
}