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
      'Prueba de pulsar en Formulario nuevo', (
      WidgetTester tester) async {
    // todo pruebas de widgets

    //Encontramos los botones
    final botonesMenu = find.byKey(ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(0));
    await tester.pump();

    //Lo esperado
    expect(find.text("Formulario nuevo"), findsOneWidget);
  });
  testWidgets(
      'Prueba de pulsar en Buscar formulario', (
      WidgetTester tester) async {
    // todo pruebas de widgets

    //Encontramos los botones
    final botonesMenu = find.byKey(ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(1));
    await tester.pump();

    //Lo esperado
    expect(find.text("Buscar formulario"), findsOneWidget);
  });
  testWidgets(
      'Prueba de pulsar en Editar Perfil', (
      WidgetTester tester) async {
    // todo pruebas de widgets

    //Encontramos los botones
    final botonesMenu = find.byKey(ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(2));
    await tester.pump();

    //Lo esperado
    expect(find.text("Editar perfil"), findsOneWidget);
  });
}