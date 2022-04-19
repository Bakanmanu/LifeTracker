import 'package:flutter/material.dart';

///Este fichero sirve para crear la parte gráfica a la hora de
///editar el perfil de usuario

class PantallaPerfilUsuario extends StatefulWidget{

  @override
  _PantallaPerfilUsuarioState createState() => _PantallaPerfilUsuarioState();
}

class _PantallaPerfilUsuarioState extends State<PantallaPerfilUsuario>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Pantalla Editar Perfil"), backgroundColor: Colors.purple,),
        backgroundColor: Colors.purple,
        body: const Center(
          child: Text("ESTA CARACTERÍSTICA AÚN NO ESTÁ IMPLEMENTADA :("),
        )
    );
  }
}