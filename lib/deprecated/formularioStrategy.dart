
/// Esta clase se encarga de definir la interfaz que va a usarse
/// para el patrón Strategy a la hora de elegir si un formulario
/// se está creando nuevo o se está editando

abstract class FormularioStrategy {

  /// Método que sire para elegir el título que va a tener
  /// la appBar superior
  String ponerTitulo();

  /// método que cargará:
  ///   Caso nuevo form: datos default
  ///   Caso modif form: datos guardados
  List cargarDatos();

  /// método para guardar los datos
  ///   Caso nuevo form: instancia nuevo formulario
  ///   Caso modif form: actualiza datos
  void enviarDatos();

}