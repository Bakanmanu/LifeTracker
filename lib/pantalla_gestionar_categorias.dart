import 'package:flutter/material.dart';

///Este fichero sirve para crear la parte gráfica a la hora de
///editar el perfil de usuario

class PantallaGestionarCategoria extends StatefulWidget{
  const PantallaGestionarCategoria({Key? key}) : super(key: key);

  @override
  _PantallaGestionarCategoriaState createState() => _PantallaGestionarCategoriaState();
}

class _PantallaGestionarCategoriaState extends State<PantallaGestionarCategoria>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("Categorías"), backgroundColor: Colors.purple,),
        backgroundColor: Colors.purple,
        body: const Center(
          child: Text("ESTA CARACTERÍSTICA AÚN NO ESTÁ IMPLEMENTADA :(\n"
              "en un futuro se podrán crear, borrar, editar, importar y exportar packs de categorías"),
        )
    );
  }
}