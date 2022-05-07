import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_gestionar_categorias.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_perfil.dart';
import '../funcionalidad/formulario.dart';
import './elementos_menu.dart';
class PantallaMenu extends StatefulWidget{
  const PantallaMenu({Key? key}) : super(key: key);

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("MENÚ"),),
      body: GridView.builder(
        itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.all(10),
              //Decoration todo revisar
              child: GestureDetector(
                key: const Key("BotonesMenu"),
                onTap: (){

                  // SWITCH PARA ACCEDER A LOS DISTINTOS MENÚS
                  switch(menu[index].id){
                    case 1: //Caso de que sea para rellenar un nuevo formulario
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                            GestorFormulario.instance.setStratCrear(); // Ponemos la estrategia Crear
                            return const PantallaFormulario();
                          }));
                      break;

                    case 2: //Caso de que sea para consultar los formularios
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaMostrarFormulario()));
                      break;

                    case 3: //Caso para editar el perfil, implementación en un futuro
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaPerfilUsuario()));
                      break;

                    case 4: //Caso para gestionar categorías
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaGestionarCategoria()));
                      break;
                  }
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/"+menu[index].imagen, width: 80,),
                      Text(menu[index].nombre,),
                    ],
              )
              ),
            );
          }
      ),
    );
  }
}