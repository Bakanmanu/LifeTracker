///Este fichero sirve para crear la parte gráfica a la hora de crear
///un nuevo formulario. Por ello, se relacionará directamente con el fichero
///formulario.dart

import 'package:flutter/material.dart';
import 'package:practica2_ds/accion.dart';
import 'package:practica2_ds/elementosEstadoAnimo.dart';
import 'package:practica2_ds/formulario.dart';
import "categoria.dart";

class PantallaFormulario extends StatefulWidget{

  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}

class _PantallaFormularioState extends State<PantallaFormulario>{

  int _estadoAnimo = 3; //Valor por defecto: estado de ánimo neutral
  //todo revisar si hay algún hint text o algo

  final List<Categoria> _categorias = [
    Categoria(enunciado: '¿Cuánto has dormido?',
        acciones: [Accion("1-3 horas", false), Accion("4-6 horas", false), Accion("6-8 horas", false), Accion("más de 8 horas", false)]),
    Categoria(enunciado: '¿Qué has comido?',
        acciones: [Accion("fruta", false), Accion("verdura", false), Accion("carne", false), Accion("pollo", false), Accion("pasta", false)]),
  ];

  GestorFormulario gestor = GestorFormulario();

  String _campoTexto = ''; //siempre va a haber un campo de texto, aunque esté vacío


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Rellenar Formulario"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
        //todo modificar y rellenar
      body: SafeArea(
        child:
          ListView(
            children: [
              //TODO poner las caritas del estado de ánimo
              Container(
                child: GridView.builder(
                itemCount: estadosAnimo.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context,index){
                  return Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                      decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15),),
                      child: GestureDetector(
                      onTap: (){
                    switch(estadosAnimo[index].id){
                      case 1:
                        _estadoAnimo = 1;
                        break;
                      case 2:
                        _estadoAnimo = 2;
                        break;
                      case 3:
                        _estadoAnimo = 3;
                        break;
                      case 4:
                        _estadoAnimo = 4;
                        break;
                      case 5:
                        _estadoAnimo = 5;
                        break;
                    }
                  },
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("assets/triste.png:
                  }", width: 40,),
                  ],
                  ),
                ),
              ),
              Container( //AQUÍ EMPIEZA LA PARTE DE CATEGORÍAS Y ACCIONES
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
                                    Checkbox(
                                        value: categoria.acciones[indexAcciones].activo,
                                        onChanged: (value){
                                          setState(() {
                                            categoria.acciones[indexAcciones].cambiarActivo(); //Cambiamos el estado de la acción al hacer click
                                          });
                                    },
                                        activeColor: Colors.deepPurple,
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
              // TODO PONER EL CAMPO DE SOLICITUD DE TEXTO

              // TODO PONER EL BOTÓN QUE LLAMA AL MÉTODO DE CREAR FORMULARIO
                //todo habría que mandar el parámetro de _categorías

            ],
          ),
      ),
    );
  }
}