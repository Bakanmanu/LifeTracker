

/// Esta clase se encarga gestionar las categorías (crear, editar, borrar, importar o exportar)
/// concretamente, va muy de la mano con la aplicación web.
/// Es una clase Singleton
class GestorCategorias {


  ///SINGLETON PARA NO CREAR MÁS DE 1 INSTANCIA DEL GESTOR
  GestorCategorias._privateConstructor();
  static final GestorCategorias _instance = GestorCategorias._privateConstructor();
  static GestorCategorias get instance => _instance;

/// CREAR
/// EDITAR
/// BORRAR
/// IMPORTAR DESDE APPWEB
/// EXPORTAR (SUBIR) A APPWEB
///
/// Posibles atributos:
///   -Lista de categorías creadas
///     este atributo se podría vincular con un booleano para indicar si está activa la categoría
///     en plan: si el usuario quiere que le aparezca en los formularios todo revisar
///     Habría que tener cuidado con las que ya estén guardadas de no quitarlas, sólo sería
///     que dejarían de aparecer en nuevo formulario, al editar los anteriores sí debería aparecer
///
///   -Tal vez algo como en GestorFormulario que indique si es para crear o modificar
///       una categoría
///
///   -Algún tipo de atributo relacionado con la conexión a la API

}

