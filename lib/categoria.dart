import "accion.dart";

class Categoria{
  final String enunciado; //nombre de la categoria
  final List<Accion> acciones; //lista de acciones
  final List<Accion> respuestas; //una lista de las acciones seleccionadas por el usuario

  Categoria({ //Constructor
    required this.enunciado,
    required this.acciones,
    this.respuestas = const [],
  });

  Categoria actualizarCategoria(List<Accion> respuestas){ //para actualizar la lista según seleccione o deseleccione el usuario una acción
    return Categoria(enunciado: enunciado, acciones: acciones, respuestas: respuestas,);
  }
}