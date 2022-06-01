import 'package:flutter_test/flutter_test.dart';
import 'package:life_tracker/funcionalidad/accion.dart';
import 'package:life_tracker/funcionalidad/categoria.dart';
import 'package:life_tracker/funcionalidad/formulario.dart';

/// En este fichero se incluirán las pruebas unitarias de GestorFormulario

void main() {
  group('GestorFormulario', () {
    test('los campos se han guardado bien y que la lista de formularios tiene el numero de formularios', (){
      GestorFormulario gestor = GestorFormulario();

      //Creamos una lista de categorías para poder llamar al método
      List<Categoria> lCategorias = [Categoria(enunciado: '¿Qué has comido?', acciones: [
        Accion(1, "fruta", false),
        Accion(2, "verdura", false),
        Accion(3, "carne", false),
        Accion(4, "pollo", false),
        Accion(5, "pasta", false)
      ])];

      expect(gestor.listaFormularios.length, 0); //comprobamos que se inicializa a 0 formularios

      //USAMOS EL MÉTODO Y CREAMOS EL FORMULARIO
      gestor.crearFormulario(3, lCategorias, "hola muy buenas");

      Formulario f = gestor.listaFormularios.last;

      expect(f.estadoAnimo, 3);
      expect(f.listaCategorias, lCategorias);
      expect(f.campoTexto, "hola muy buenas");
      expect(gestor.listaFormularios.length, 1); //comprobamos que solo hay un formulario
    });


    test('el numero de formularios debe reducirse en 1 si se llama al metodo borrarFormulario()', (){
      GestorFormulario gestor = GestorFormulario();

      //Creamos una lista de categorías para poder llamar al método
      List<Categoria> lCategorias = [Categoria(enunciado: '¿Qué has comido?', acciones: [
        Accion(1, "fruta", false),
        Accion(2, "verdura", false),
        Accion(3, "carne", false),
        Accion(4, "pollo", false),
        Accion(5, "pasta", false)
      ])];

      // Añadimos un par de formularios
      gestor.crearFormulario(3, lCategorias, "1");
      gestor.crearFormulario(5, lCategorias, "2");

      //llamamos al método:
      gestor.borrarFormulario(gestor.listaFormularios.first);

      expect(gestor.listaFormularios.length, 2); //comprobamos que solo hay dos formularios,
      // el creado en el test anterior y uno de los creados en este test
    });
  });
}