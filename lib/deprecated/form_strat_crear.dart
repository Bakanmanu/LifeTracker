
import 'package:practica2_ds/deprecated/form_strategy.dart';

/// Esta clase se encarga de implementar la interfaz formularioStrategy,
/// concretamente para el caso de que el formulario vaya a ser creado

class FormStrategyCrear implements FormularioStrategy {

  @override
  List cargarDatos() {
    return [3, ];
  }

  @override
  void enviarDatos() {
    // implement enviarDatos
  }

  @override
  String ponerTitulo() => 'Nuevo formulario';


}