///Este fichero sirve para crear la parte gráfica a la hora de crear
///un nuevo formulario. Por ello, se relacionará directamente con el fichero
///formulario.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practica2_ds/accion.dart';
import 'package:practica2_ds/elementosEstadoAnimo.dart';
import 'package:practica2_ds/formulario.dart';
import 'package:practica2_ds/pantallaMenu.dart';
import 'package:practica2_ds/pantallaFormulario.dart';
import "categoria.dart";

class PantallaEditarFormulario extends StatefulWidget {
  const PantallaEditarFormulario({Key? key}) : super(key: key);

  @override
  _PantallaEditarFormularioState createState() => _PantallaEditarFormularioState();
}

class _PantallaEditarFormularioState extends State<PantallaEditarFormulario> {

  //Como tenemos hecho el Singleton, nos devolverá el mismo gestor de formulario
  // que el que se creó en pantallaFormulario.dart
  static GestorFormulario gestor = GestorFormulario(); //todo esto da problemas

  static Formulario form = gestor.getFormEditar(); //todo esto da problemas

  //Recuperamos los campos del formulario
  int _estadoAnimo = form.estadoAnimo;
  final List<Categoria> _categorias = form.listaCategorias;
  String _campoTexto = form.campoTexto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rellenar formulario"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple,

      body: Column(
        //mainAxisAlignment:,
        children: <Widget>[
          /// AQUÍ EMPIEZA LO DEL ESTADO DE ÁNIMO
          SizedBox(
            height: 80,
            child:
            GridView.builder(
                itemCount: estadosAnimo.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), // 5 columnas
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(30),),
                    child: GestureDetector(
                        onTap: (){
                          print("click en "+estadosAnimo[index].nombre); // DEBUG

                          // SWITCH PARA CAMBIAR LOS DISTINTOS ESTADOS DE ÁNIMO

                          // TODO HACER QUE SE MARQUE EL PULSADO
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/"+estadosAnimo[index].imagen, width: 20,),
                            Text(estadosAnimo[index].nombre, style: const TextStyle(color: Colors.white, fontSize: 9),),
                          ],
                        )
                    ),
                  );
                }
            ),
          ),

          ///AQUÍ EMPIEZA LA PARTE DE CATEGORÍAS Y ACCIONES
          Flexible(
            child:
            SafeArea(
              child:
              ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
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
                              Text(categoria.enunciado, style: const TextStyle(color: Colors.white, fontSize: 20),),
                              const SizedBox(height: 15,),
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
                                          Text(categoria.acciones[indexAcciones].nombre, style: const TextStyle(color: Colors.black, fontSize: 16)),
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
          ),

          /// AQUÍ EMPIEZA EL CAMPO DE TEXTO
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 60),
            child:
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15),),
                  child: TextField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Cuenta aquí qué tal te ha ido el día',
                    ),
                    onChanged: (String textoEscrito){
                      _campoTexto = textoEscrito;
                    },
                  ),
                ),
          )
        ],
      ),

      /// BOTÓN PARA GUARDAR EL FORMULARIO
      floatingActionButton: ElevatedButton(
        onPressed: () {
          gestor.editarFormulario(_estadoAnimo, _categorias, _campoTexto);
          Navigator.pop(context, MaterialPageRoute(builder: (_)=>PantallaMenu()));
          _mostrarAlertaFormCorrecto(); //Botón de alerta para notificar que el form se ha creado correctamente
        },
        child: const Text('Enviar formulario'),
      ),
    );
  }

  /// Esta función genera una alerta emergente para notificar de que el formulario se ha guardado
  Future <void> _mostrarAlertaFormCorrecto() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('El formulario se ha guardado correctamente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Para borrarlo o modificarlo, ve a "Buscar formulario" '
                    'en el Menú'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Gracias :)'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

