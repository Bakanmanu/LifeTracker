import "accion.dart";

class Categoria{
  final String enunciado; //nombre de la categoria
  final List<Accion> acciones; //lista de todas las acciones
  List<Accion> respuestas = []; //una lista de las acciones seleccionadas por el usuario

  Categoria({ //Constructor
    required this.enunciado,
    required this.acciones,
  });

  void anadirRespuesta(Accion a) => respuestas.add(a);

  void actualizarCategoria(List<Accion> newRespuestas){ //para actualizar la lista según seleccione o deseleccione el usuario una acción
    respuestas = newRespuestas;
  }
}