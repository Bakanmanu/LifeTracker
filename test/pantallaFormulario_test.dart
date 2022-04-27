import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practica2_ds/main.dart';
import 'package:practica2_ds/pantallaFormulario.dart';
import 'package:practica2_ds/pantallaMenu.dart';

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
    testWidgets('Prueba de que pulsar una cara se almacene en la variable estadoAnimo', (WidgetTester tester) async {
        // todo pruebas de widgets

        //Encontramos los botones de estados de animo
        final botonesEstadoAnimo = find.byKey(ValueKey("Botones estadoAnimo"));

        //Ejecutamos el test
        await tester.pumpWidget(MaterialApp(home: PantallaFormulario()));
        await tester.tap(botonesEstadoAnimo);
        await tester.pump();

        //Lo esperado
        expect(find.text("Neutro"), findsOneWidget);

    });
    testWidgets('Prueba de que se escribe en el campo de texto', (WidgetTester tester) async {
        // todo pruebas de widgets
        //Encontramos el campo de texto
        final addtexto = find.byKey(ValueKey("addTexto"));

        //Ejecutamos el test
        await tester.pumpWidget(MaterialApp(home: PantallaFormulario()));
        await tester.enterText(addtexto,"Prueba del texto");
        await tester.pump();

        //Lo esperado
        expect(find.text("Prueba del texto"), findsOneWidget);


    });
}