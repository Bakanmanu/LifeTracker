import 'package:flutter/material.dart';
import 'package:practica2_ds/pantallaFormulario.dart';
import 'package:practica2_ds/pantallaMostrarFormularios.dart';
import 'elementosMenu.dart';
class PantallaMenu extends StatefulWidget{

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("MENÚ"), backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple,
      body: Container(
        child: GridView.builder(
          itemCount: Menu.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(30),),
                child: GestureDetector(
                  onTap: (){
                    print("click en "+Menu[index].nombre); // todo esto se puede quitar, es para debuguear

                    // SWITCH PARA ACCEDER A LOS DISTINTOS MENÚS
                    switch(Menu[index].id){
                      case 1: //Caso de que sea para rellenar un nuevo formulario
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PantallaFormulario()));
                        break;

                      case 2: //Caso de que sea para consultar los formularios
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PantallaMostrarFormulario()));
                        break;
                      case 3: //Caso para editar el perfil, implementación en un futuro
                    }
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/"+Menu[index].imagen, width: 80,),
                        Text(Menu[index].nombre, style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                )
                ),
              );
            }
        ),
      ),
    );
  }
}