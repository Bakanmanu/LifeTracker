import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practica2_ds/main.dart';
import 'package:practica2_ds/pantallaFormulario.dart';

/// En este fichero se incluirán las pruebas de Widgets
/// En este fichero se incluirán las pruebas de pantallaMenu
///
void main() {
    testWidgets(
        'Prueba de que pulsar una cara registre dicho estado de ánimo en el formulario', (WidgetTester tester) async {
        // todo pruebas de widgets
        await tester . pumpWidget ( PantallaFormulario () ) ;

        expect ( find . textContaining ( '3 ') , findsOneWidget ) ;
        expect ( find . textContaining ( '4 ') , findsNothing ) ;

        await tester . tap ( find.text('Feliz')) ;
        await tester . pump () ;


        expect(find.textContaining('5'), findsOneWidget);
        expect ( find . textContaining ( '3 ') , findsNothing ) ;

    });
    testWidgets(
        'Prueba de que pulsar una accion cambie su booleano asociado en el formulario', (WidgetTester tester) async {
        // todo pruebas de widgets
        //
    });
    testWidgets('Prueba de que cuando le des al botón de guardar formulario te salga la alerta correspondiente', (WidgetTester tester) async {
        // todo pruebas de widgets
        //
    });
}