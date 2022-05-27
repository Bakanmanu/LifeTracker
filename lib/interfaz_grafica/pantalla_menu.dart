import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:life_tracker/deprecated/pantalla_gestionar_categorias.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_perfil.dart';
import '../funcionalidad/formulario.dart';
import '../funcionalidad/usuario.dart';
import './elementos_menu.dart';
class PantallaMenu extends StatefulWidget{
  const PantallaMenu({Key? key}) : super(key: key);

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu>{
  
  GestorFormulario gestor = GestorUsuario.instance.currentUser!.gestorFormulario;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("MENÚ"),
        actions: [
          GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaPerfilUsuario()));},
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset("assets/perfil.png"))
          ),
        ],
      ),

      body: GridView.builder(
        itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.all(10),
              //Decoration todo revisar
              child: GestureDetector(
                key: const Key("BotonesMenu"),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/"+menu[index].imagen, width: 80,),
                    Text('\n' + menu[index].nombre,), //todo poner un poco más bonito el texto, tal vez con un container
                  ],
                ),

                onTap: (){

                  // SWITCH PARA ACCEDER A LOS DISTINTOS MENÚS
                  switch(menu[index].id){
                    case 1: //Caso de que sea para rellenar un nuevo formulario
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                            //GestorFormulario.instance.setStratCrear(); // Ponemos la estrategia Crear //todo quitar de aqui
                            gestor.setStratCrear(); // todo revisar
                            return const PantallaFormulario();
                          }));
                      break;

                    case 2: //Caso de que sea para consultar los formularios
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaMostrarFormulario()));
                      break;

                      /// deprecated
                    case 3: //Caso para editar el perfil, implementación en un futuro
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaPerfilUsuario()));
                      break;

                      /// deprecated
                    case 4: //Caso para gestionar categorías
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaGestionarCategoria()));
                      break;
                  }
                },
              ),
            );
          }
      ),
    );
  }
}