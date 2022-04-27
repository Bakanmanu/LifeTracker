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
        await tester.pumpWidget(const PantallaFormulario());

        // expect(find.byWidget(Scaffold()), findsOneWidget);


        // await tester.tap(find.text('Feliz'));
        // await tester.pump();
        //
        // expect(find.textContaining('5'), findsOneWidget);
        // expect(find.textContaining('3'), findsNothing);

    });
    testWidgets('Prueba de que cuando le das al botón de borrar formulario te sale alerta', (WidgetTester tester) async {
        // todo pruebas de widgets
        //
    });
}