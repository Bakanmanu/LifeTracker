import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practica2_ds/main.dart';
import 'package:practica2_ds/interfaz_grafica/pantalla_formulario.dart';

/// En este fichero se incluirán las pruebas de Widgets
/// En este fichero se incluirán las pruebas de pantallaMenu
///
void main() {
    testWidgets(
        'Prueba de que se muestra el botón de comenzar', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.textContaining('Comenzar'), findsOneWidget);

        // await tester.tap(find.text('Comenzar'));
        // await tester.pump();
        // expect(find.textContaining('MENÚ'), findsOneWidget); //ha cambiado de pantalla

    });
    testWidgets('Prueba de pulsar un estado de Animo, el estado Neutro en este caso', (WidgetTester tester) async {
        //Encontramos los botones de estados de animo
        final botonesEstadoAnimo = find.byKey(const ValueKey("Botones estadoAnimo"));

        //Ejecutamos el test
        await tester.pumpWidget(const MaterialApp(home: PantallaFormulario()));
        await tester.tap(botonesEstadoAnimo.at(3));
        await tester.pump();

        //Lo esperado
        expect(find.text("Neutro"), findsOneWidget);

    });
    testWidgets('Prueba de que se escribe en el campo de texto', (WidgetTester tester) async {
        //Encontramos el campo de texto
        final addtexto = find.byKey(const ValueKey("addTexto"));

        //Ejecutamos el test
        await tester.pumpWidget(const MaterialApp(home: PantallaFormulario()));
        await tester.enterText(addtexto,"Prueba del texto");
        await tester.pump();

        //Lo esperado
        expect(find.text("Prueba del texto"), findsOneWidget);


    });
}