import 'package:flutter/material.dart';
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
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(30),),
                child: GestureDetector(
                  onTap: (){
                    print("click en "+Menu[index].nombre); // todo aquí hay que llamar a las funciones para crear los forms
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/"+Menu[index].imagen, width: 100,),
                        Text(Menu[index].nombre, style: TextStyle(color: Colors.white, fontSize: 30),),
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