import 'package:flutter/material.dart';
import 'package:life_tracker/theme/colors.dart';
import 'interfaz_grafica/pantalla_login.dart';
import 'package:dcdg/dcdg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Tracker',
      debugShowCheckedModeBanner: false,
      theme: //ThemeData.fallback(),
      ThemeData(
        primarySwatch: Colors.purple, //todo aqui hay que hacer el theme y especificar los colores por defecto
        scaffoldBackgroundColor: background, //todo ajustar el color
        //backgroundColor: background,
      ),
      home: const Login(),
    );
  }
}

