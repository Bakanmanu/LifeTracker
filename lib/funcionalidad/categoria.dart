import './accion.dart';

class Categoria{
  String enunciado; //nombre de la categoria
  List<Accion> acciones; //lista de todas las acciones
  List<Accion> respuestas = []; //una lista de las acciones activadas por el usuario (todas han de ser true)
  bool isRespuestasVacio = true;

  Categoria({ //Constructor
    required this.enunciado,
    required this.acciones,
  });

  void anadirAccion(Accion a) => acciones.add(a);

  void anadirRespuesta(Accion a){
    if(a.activo) { // Comprobamos que está activa
      respuestas.add(a);
    }
  }

  void actualizarRespuestas(){ //para actualizar la lista según seleccione o deseleccione el usuario una acción
    respuestas.clear(); //Borramos todas las respuestas para volver a poner las que estén
    isRespuestasVacio = true;
    for (Accion acc in acciones) {
      if (acc.activo) { // si la acción está seleccionada
        respuestas.add(acc); //añadimos la acción activa a la lista de respuestas
      }
    }
    if (respuestas.isNotEmpty){
      isRespuestasVacio = false;
    }
  }
}