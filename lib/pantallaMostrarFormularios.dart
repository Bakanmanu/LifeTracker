import 'package:flutter/material.dart';
import 'package:practica2_ds/elementosEstadoAnimo.dart';
import 'package:practica2_ds/formulario.dart';

///Este fichero sirve para crear la parte gráfica a la hora de visualizar
///los formularios.

class PantallaMostrarFormulario extends StatefulWidget{


  @override
  _PantallaMostrarFormularioState createState() => _PantallaMostrarFormularioState();
}

class _PantallaMostrarFormularioState extends State<PantallaMostrarFormulario>{
  GestorFormulario gestor = GestorFormulario();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Buscar Formulario"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
      //todo modificar y rellenar
      ///Listado de Formularios realizados
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: gestor.listaFormularios.length,                // Obtiene la cantidad de Formularios que contiene la lista  para así iterar como un bucle for
          itemBuilder: (BuildContext context, int index) {          // Con esto irá instanciando contenedores e index será la variable que aumentará por cada "iteracion"
            return Container(
              //height: 80,
              color: Colors.purple,
              child: Card(
                color: Colors.deepPurpleAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.asset("assets/"+estadosAnimo[gestor.listaFormularios[index].estadoAnimo - 1].imagen, width:40),
                      title: Text(gestor.listaFormularios[index].fecha.toString()),
                      subtitle: Text(gestor.listaFormularios[index].campoTexto),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                          ),
                          child: const Text('ABRIR'),
                          onPressed: (){},                //todo Mostrar el formulario al clicar el boton
                        ),
                        const SizedBox(width: 8),
                        TextButton(               //Boton para editar un formulario ya creado (Se podría implementar en el boton anterior )
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                          ),
                          child: const Text('MODIFICAR'),
                          onPressed: () {},
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


}
