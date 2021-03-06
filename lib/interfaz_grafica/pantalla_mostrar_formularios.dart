// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:smiley_ui/smiley_ui.dart';

import '../funcionalidad/formulario.dart';
import '../funcionalidad/usuario.dart';
import '../theme/colors.dart';

///Este fichero sirve para crear la parte gráfica a la hora de visualizar
///los formularios.

class PantallaMostrarFormulario extends StatefulWidget{
  const PantallaMostrarFormulario({Key? key}) : super(key: key);

  @override
  _PantallaMostrarFormularioState createState() => _PantallaMostrarFormularioState();
}

class _PantallaMostrarFormularioState extends State<PantallaMostrarFormulario>{
  GestorFormulario gestor = GestorUsuario.instance.currentUser!.gestorFormulario;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Todos los formularios"),),

      ///Listado de Formularios realizados
      body: gestor.listaFormularios.isEmpty ? //CONDICIONAL ENTRE CENTER Ó COLUMN SEGUN HAYA FORMULARIOS O NO

      Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: const Text(
              "Aún no tienes formularios :(\nPrueba a crear uno pulsando el botón de abajo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(Icons.arrow_downward),
        ],
      )

          : // operador ternario condicional, esto hace que si gestor.listaFormularios.isEmpty es false, sea esto lo que se ejecute

      ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: gestor.listaFormularios.length,       // Obtiene la cantidad de Formularios que contiene la lista  para así iterar como un bucle for
          itemBuilder: (BuildContext context, int index) { // Con esto irá instanciando contenedores e index será la variable que aumentará por cada "iteracion"

            /// Selección del color para el fondo del formulario segun estado animo
            late Color color, colorStrong;
            switch(gestor.listaFormularios[index].estadoAnimo){
              case 1: color = formEnfadado; colorStrong = enfadado; break;
              case 2: color = formTriste;   colorStrong = triste;   break;
              case 3: color = formNeutral;  colorStrong = neutral;  break;
              case 4: color = formFeliz;    colorStrong = feliz;    break;
              case 5: color = formContento; colorStrong = contento; break;
            }

            return Container(
              child: Card(
                  color: color,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      /// INFO ESTADO ANIMO + CATEGORÍAS
                      ListTile(
                        leading: getCaraEstadoAnimo(gestor.listaFormularios[index].estadoAnimo), // Elegimos la cara según
                        isThreeLine: true,
                        title: Text(gestor.getFechaFormat(gestor.listaFormularios[index]) + '\n'),
                        subtitle: Text(
                          gestor.getRespuestasAcciones(gestor.listaFormularios[index]),
                        ),
                      ),

                      /// TEXTO DEL CAMPO DE TEXTO
                      Text(gestor.listaFormularios[index].campoTexto, style: const TextStyle(fontStyle: FontStyle.italic),),

                      /// BOTONES DE EDITAR Y BORRAR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          /// Botón Borrar
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(enfadado),
                            ),
                            child: const Text('BORRAR'),
                            onPressed: (){
                              //Llamamos a la funcion que se asegura de borrar y,
                              //si procede, la borra. Ade,
                              _alertaBorrar(gestor.listaFormularios[index]);
                            },
                          ),
                          const SizedBox(width: 8),

                          /// Botón Editar
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(colorStrong),
                            ),
                            child: const Text('MODIFICAR'),
                            onPressed: () async {
                              setState(() {});
                              gestor.setIndex(index);
                              await Navigator.push(context,
                                  MaterialPageRoute(builder: (_){
                                    gestor.setStratModificar(); // Ponemos la estrategia Modificar
                                    return const PantallaFormulario();
                                  }
                                  ));
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  )
              ),
            );
          }
      ),
    );
  }

  Widget getCaraEstadoAnimo(int estadoAnimo){
    switch(estadoAnimo){
      case 1:
        return const SmileyWidget(expression: SmileyExpression.verySad);
      case 2:
        return const SmileyWidget(expression: SmileyExpression.sad);
      case 3:
        return const SmileyWidget(expression: SmileyExpression.neutral);
      case 4:
        return const SmileyWidget(expression: SmileyExpression.happy);
      case 5:
        return const SmileyWidget(expression: SmileyExpression.veryHappy);
    }
    return const SmileyWidget(expression: SmileyExpression.neutral, isEnabled: false,); //valor que se devuelve por si hay algún error
  }

  /// Esta función se llama cuando se va a borrar un formulario, para asegurarse
  /// Además, actualiza la página para que desaparezca el form borrado
  Future <void> _alertaBorrar(Formulario form) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás segurx?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Vas a borrar un formulario. ¿de verdad quieres hacerlo?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),

            TextButton(
                child: const Text("Sí, borrar"),
                onPressed: () {
                  gestor.borrarFormulario(form);
                  // Mandamos a actualizar las estadísticas
                  GestorUsuario.instance.currentUser!.actualizarEstadisticas();

                  setState(() {}); //Actualizamos la pantalla para que no se quede el formulario estático
                  Navigator.of(context).pop(); //Quitamos la alerta
                }),
          ],
        );
      },
    );
  }
}
