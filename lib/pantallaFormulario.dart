///Este fichero sirve para crear la parte gráfica a la hora de crear
///un nuevo formulario. Por ello, se relacionará directamente con el fichero
///formulario.dart

import 'package:flutter/material.dart';

class PantallaFormulario extends StatefulWidget{

  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}

class _PantallaFormularioState extends State<PantallaFormulario>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Formulario"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
        //todo modificar y rellenar
      body: const Center(
        child: Text("PANTALLA DE FORMULARIO"),
      )
    );
  }
}