///Este fichero sirve para crear la parte gráfica a la hora de crear
///un nuevo formulario. Por ello, se relacionará directamente con el fichero
///formulario.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practica2_ds/accion.dart';
import 'package:practica2_ds/elementosEstadoAnimo.dart';
import 'package:practica2_ds/formulario.dart';
import 'package:practica2_ds/pantallaMenu.dart';
import "categoria.dart";

class PantallaFormulario extends StatefulWidget {
  const PantallaFormulario({Key? key}) : super(key: key);

  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}

class _PantallaFormularioState extends State<PantallaFormulario> {

  GestorFormulario gestor = GestorFormulario();

  int _estadoAnimo = 3; //Valor por defecto: estado de ánimo neutral
  //todo revisar si hay algún hint text o algo

  final List<Categoria> _categorias = [
    Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
      Accion("1-3 horas", false),
      Accion("4-6 horas", false),
      Accion("6-8 horas", false),
      Accion("más de 8 horas", false)
    ]),
    Categoria(enunciado: '¿Qué has comido?', acciones: [
      Accion("fruta", false),
      Accion("verdura", false),
      Accion("carne", false),
      Accion("pollo", false),
      Accion("pasta", false)
    ]),
  ];

  String _campoTexto = ''; //siempre va a haber un campo de texto, aunque esté vacío

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rellenar formulario"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple,

      //TODO Ver qué se puede hacer para no tener el expanded, que hace que
      //  el formulario se divida en partes iguales, y ver cómo se podrían meter
      //  todas las cosas una detrás de otra y que sea un scrollable general
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
                          print("click en "+estadosAnimo[index].nombre); // todo esto se puede quitar, es para debuguear

                          // SWITCH PARA CAMBIAR LOS DISTINTOS ESTADOS DE ÁNIMO
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
          Expanded(
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
          Flexible(
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

      /// BOTÓN PARA ENVIAR EL FORMULARIO
      floatingActionButton: ElevatedButton(
        onPressed: () {
          gestor.crearFormulario(_estadoAnimo, _categorias, _campoTexto);
          // todo mostrar un mensaje de éxito al crear el formulario
          // todo mandar a la pantalla de inicio
          Navigator.pop(context, MaterialPageRoute(builder: (_)=>PantallaMenu()));
        },
        child: const Text('Enviar formulario'),
      ),
    );
  }
}
