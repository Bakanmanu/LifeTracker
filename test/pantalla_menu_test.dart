import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_menu.dart';

/// En este fichero se incluirán las pruebas de Widgets
/// En este fichero se incluirán las pruebas de pantallaMenu
///
void main() {
  testWidgets(
      'Prueba de pulsar en Formulario nuevo', (
      WidgetTester tester) async {
    //Encontramos los botones
    final botonesMenu = find.byKey(const ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(const MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(0));
    await tester.pump();

    //Lo esperado
    expect(find.text("Formulario nuevo"), findsOneWidget);
  });
  testWidgets(
      'Prueba de pulsar en Buscar formulario', (
      WidgetTester tester) async {
    //Encontramos los botones
    final botonesMenu = find.byKey(const ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(const MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(1));
    await tester.pump();

    //Lo esperado
    expect(find.text("Buscar formulario"), findsOneWidget);
  });
  testWidgets(
      'Prueba de pulsar en Editar Perfil', (
      WidgetTester tester) async {
    //Encontramos los botones
    final botonesMenu = find.byKey(const ValueKey("BotonesMenu"));

    //Ejecutamos el test
    await tester.pumpWidget(const MaterialApp(home: PantallaMenu()));
    await tester.tap(botonesMenu.at(2));
    await tester.pump();

    //Lo esperado
    expect(find.text("Editar perfil"), findsOneWidget);
  });
}