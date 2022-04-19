class Accion {
  String _nombre;
  bool _activo = false;

  //Constructor
  Accion(this._nombre, this._activo);

  //Método para crear una acción públicamente usando el constructor
  Accion crearAccion(String nombre){
    return Accion(nombre, _activo);
  }

  Accion modificarAccion(String nombre){
    _nombre = nombre;
    return this;
  }

  //Eliminar accion se debe hacer desde la lista de acciones


  //Getters & Setters
  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }

  bool get activo => _activo;

  set activo(bool value){
    _activo = value;
  }
}