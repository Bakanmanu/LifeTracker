///Este fichero sirve para crear la parte gráfica a la hora de crear
///un nuevo formulario. Por ello, se relacionará directamente con el fichero
///formulario.dart

import 'package:flutter/material.dart';
import 'package:practica2_ds/accion.dart';
import "categoria.dart";

class PantallaFormulario extends StatefulWidget{

  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}

class _PantallaFormularioState extends State<PantallaFormulario>{
  @override
  final List<Categoria> _categorias = [
    Categoria(enunciado: '¿Cuánto has dormido?',
        acciones: [Accion("1-3 horas", false), Accion("4-6 horas", false), Accion("6-8 horas", false), Accion("más de 8 horas", false)]),
    Categoria(enunciado: '¿Qué has comido?',
        acciones: [Accion("fruta", false), Accion("verdura", false), Accion("carne", false), Accion("pollo", false), Accion("pasta", false)]),
  ];

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Formulario"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
        //todo modificar y rellenar
      body: SafeArea(
        child:
          ListView(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15),),
                child:
                Column(
                  children: List.generate(
                    _categorias.length,
                        (indexCategorias){
                      final categoria = _categorias[indexCategorias];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categoria.enunciado, style: TextStyle(color: Colors.white, fontSize: 20),),
                        SizedBox(height: 15,),
                        Wrap(
                          children: List.generate(
                              categoria.acciones.length,
                                  (indexAcciones){
                                return Row(
                                  children: [
                                    Checkbox(value: categoria.acciones[indexAcciones].activo, onChanged: (value){
                                    }
                                    ),
                                    Text(categoria.acciones[indexAcciones].nombre, style: TextStyle(color: Colors.black, fontSize: 16)),
                                  ],
                                );

                          }),
                        )
                      ],
                    );
                  },
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}