import 'package:flutter/material.dart';

///Este fichero sirve para crear la parte gráfica a la hora de visualizar
///los formularios.

class PantallaMostrarFormulario extends StatefulWidget{

  @override
  _PantallaMostrarFormularioState createState() => _PantallaMostrarFormularioState();
}

class _PantallaMostrarFormularioState extends State<PantallaMostrarFormulario>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Pantalla Buscar Formulario"), backgroundColor: Colors.purple,),
        backgroundColor: Colors.purple,
          //todo modificar y rellenar
        body: const Center(
          child: Text("PANTALLA DE BUSCAR FORMULARIO"),
        )
    );
  }
}