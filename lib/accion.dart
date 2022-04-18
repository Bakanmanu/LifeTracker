class Accion {
  String _nombre;
  String _descripcion;

  //Constructor
  Accion(this._nombre, this._descripcion);

  //Método para crear una acción públicamente usando el constructor
  Accion crearAccion(String nombre, String descripcion){
    return Accion(nombre, descripcion);
  }

  Accion modificarAccion(String nombre, String descripcion){
    _nombre = nombre;
    _descripcion = descripcion;
    return this;
  }

  //Eliminar acción se debe hacer desde la lista de acciones


  //Getters & Setters
  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }

  String get descripcion => _descripcion;

  set descripcion(String value) {
    _descripcion = value;
  }
}