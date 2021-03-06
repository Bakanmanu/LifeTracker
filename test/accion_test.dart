import 'package:flutter_test/flutter_test.dart';
import 'package:life_tracker/funcionalidad/accion.dart';

/// En este fichero se incluirán las pruebas unitarias de Accion

void main() {
  group('Accion', () {
    test('ver que se crea la accion', (){
      Accion acc1 = Accion(1, "Prueba1", true);
      Accion acc2 = Accion(1, "Prueba2", false);

      expect(acc1.nombre, "Prueba1");
      expect(acc1.activo, true);

      expect(acc2.nombre, "Prueba2");
      expect(acc2.activo, false);
    });

    test('comprobar que se cambia correctamente cada vez que se llama cambiarActivo()', (){
      Accion acc = Accion(1, "Prueba1", true);

      //Llamamos al método
      acc.cambiarActivo();
      expect(acc.activo, false);

      //Llamamos al método otra vez
      acc.cambiarActivo();
      expect(acc.activo, true);
    });
  });
}