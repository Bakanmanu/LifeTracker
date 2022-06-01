import 'package:flutter_test/flutter_test.dart';
import 'package:life_tracker/funcionalidad/accion.dart';
import 'package:life_tracker/funcionalidad/categoria.dart';

/// En este fichero se incluirán las pruebas unitarias de Categoria

void main() {
  group('Categoria', () {
    test('ver que la respuesta se añade y comprueba si es true', (){
      Categoria cat = Categoria(enunciado: '¿Qué has comido?', acciones: []); //No hace falta poner acciones
      Accion acc1 = Accion(1, "Prueba1", true);
      Accion acc2 = Accion(2, "Prueba2", false);

      // Añadimos las acciones a las respuestas, una true y una false
      cat.anadirRespuesta(acc1);
      cat.anadirRespuesta(acc2);

      expect(cat.respuestas.length, 1); // Se espera sólo 1
    });


    test('ver que las respuestas se guardan correctamente', (){
      Categoria cat = Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
        Accion(1, "tocar la guitarra", true),
        Accion(2, "salir a correr",    false),
        Accion(3, "ir al gimnasio",    true),
        Accion(4, "echar la siesta",   false),
        Accion(5, "comer con amigos",  true),
        Accion(6, "hacer la colada",   false)
      ]);

      cat.actualizarRespuestas();

      expect(cat.respuestas.length, 3);
    });
  });
}