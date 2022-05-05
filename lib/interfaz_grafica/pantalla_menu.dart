import 'package:flutter/material.dart';
import 'package:practica2_ds/funcionalidad/formulario.dart';
import 'package:practica2_ds/interfaz_grafica/pantalla_formulario.dart';
import 'package:practica2_ds/interfaz_grafica/pantalla_gestionar_categorias.dart';
import 'package:practica2_ds/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:practica2_ds/interfaz_grafica/pantalla_perfil.dart';
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
      appBar: AppBar(title: const Text("MENÚ"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
      body: GridView.builder(
        itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(30),),
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
                      Text(menu[index].nombre, style: const TextStyle(color: Colors.white, fontSize: 18),),
                    ],
              )
              ),
            );
          }
      ),
    );
  }
}