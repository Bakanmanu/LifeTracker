import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practica2_ds/accion.dart';
import 'package:practica2_ds/categoria.dart';
import 'package:practica2_ds/formulario.dart';

/// En este fichero se incluirán las pruebas unitarias de GestorFormulario

void main() {
  group('Categoria', () {
    test('ver que la respuesta se añade y comprueba si es true', (){
      Categoria cat = Categoria(enunciado: '¿Qué has comido?', acciones: []); //No hace falta poner acciones
      Accion acc1 = Accion("Prueba1", true);
      Accion acc2 = Accion("Prueba2", false);

      // Añadimos las acciones a las respuestas, una true y una false
      cat.anadirRespuesta(acc1);
      cat.anadirRespuesta(acc2);

      expect(cat.respuestas.length, 1); // Se espera sólo 1
    });


    test('ver que las respuestas se guardan correctamente', (){
      Categoria cat = Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
        Accion("tocar la guitarra", true),
        Accion("salir a correr",    false),
        Accion("ir al gimnasio",    true),
        Accion("echar la siesta",   false),
        Accion("comer con amigos",  true),
        Accion("hacer la colada",   false)
      ]);

      cat.actualizarRespuestas();

      expect(cat.respuestas.length, 3);
    });
  });
}