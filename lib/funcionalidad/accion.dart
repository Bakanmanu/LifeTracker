class Accion {
  String nombre;
  bool activo = false;

  //Constructor
  Accion(this.nombre, this.activo);

  //Método para crear una acción públicamente usando el constructor
  Accion crearAccion(String nombre){
    return Accion(nombre, activo);
  }

  Accion modificarAccion(String nom){
    nombre = nom;
    return this;
  }

  void cambiarActivo(){
    activo = !activo;
  }
}