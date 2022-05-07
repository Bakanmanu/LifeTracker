import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';

import '../funcionalidad/elementos_estado_animo.dart';
import '../funcionalidad/formulario.dart';

///Este fichero sirve para crear la parte gráfica a la hora de visualizar
///los formularios.

class PantallaMostrarFormulario extends StatefulWidget{
  const PantallaMostrarFormulario({Key? key}) : super(key: key);

  @override
  _PantallaMostrarFormularioState createState() => _PantallaMostrarFormularioState();
}

class _PantallaMostrarFormularioState extends State<PantallaMostrarFormulario>{
  GestorFormulario gestor = GestorFormulario.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Todos los formularios"), backgroundColor: Colors.purple,), //todo cambiar color
      backgroundColor: Colors.purple, //todo cambiar color

      ///Listado de Formularios realizados
      body: gestor.listaFormularios.isEmpty ? //CONDICIONAL ENTRE CENTER Ó COLUMN SEGUN HAYA FORMULARIOS O NO

      // todo formatear un poco este texto y ponerlo bonito
      const Center(child: Text("Aún no tienes formularios :(. \nPrueba a crear uno desde 'Nuevo Formulario' en menú principal"),)

      : // operador ternario condicional, esto hace que si gestor.listaFormularios.isEmpty es false, sea esto lo que se ejecute

      ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: gestor.listaFormularios.length,       // Obtiene la cantidad de Formularios que contiene la lista  para así iterar como un bucle for
          itemBuilder: (BuildContext context, int index) { // Con esto irá instanciando contenedores e index será la variable que aumentará por cada "iteracion"
            return Container(
              //height: 80,
              color: Colors.purpleAccent[400], //todo cambiar color
              child: Card(
                color: Colors.purpleAccent, //todo cambiar color
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.asset("assets/"+estadosAnimo[gestor.listaFormularios[index].estadoAnimo - 1].imagen, width:40),
                      isThreeLine: true,
                      title: Text(gestor.getFechaFormat(gestor.listaFormularios[index]) + '\n'),
                      subtitle: Text(gestor.getRespuestasAcciones(gestor.listaFormularios[index])),
                    ),

                    /// Aquí se podría hacer un container si se quisiera poner más bonito todo revisar
                    Text(gestor.listaFormularios[index].campoTexto),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), //todo cambiar color
                          ),
                          child: const Text('BORRAR'),
                          onPressed: (){
                            //Llamamos a la funcion que se asegura de borrar y,
                            //si procede, la borra. Ade,
                            _alertaBorrar(gestor.listaFormularios[index]);
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(               //Boton para editar un formulario ya creado
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200), //todo cambiar color
                          ),
                          child: const Text('MODIFICAR'),
                          onPressed: () async {
                            gestor.setIndex(index);
                            await Navigator.push(context,
                                MaterialPageRoute(builder: (_){
                                  GestorFormulario.instance.setStratmodificar(); // Ponemos la estrategia Modificar
                                  return const PantallaFormulario();
                                }
                            ));
                            setState(() {});
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
                child: const Text("Sí, borrar"),
                onPressed: () {
                  gestor.borrarFormulario(form);
                  setState(() {}); //Actualizamos la pantalla para que no se quede el formulario estático
                  Navigator.of(context).pop(); //Quitamos la alerta
                }),

            TextButton(
                child: const Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
