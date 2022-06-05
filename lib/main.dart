import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_tracker/theme/colors.dart';
import 'interfaz_grafica/pantalla_login.dart';

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
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: background,
        textTheme: GoogleFonts.pangolinTextTheme(), //openSans
        //backgroundColor: background,
      ),
      home: const Login(),
    );
  }
}

