import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_login.dart';

import '../theme/colors.dart';

///Este fichero sirve para crear la parte gráfica a la hora de
///editar el perfil de usuario

class PantallaPerfilUsuario extends StatefulWidget{
  const PantallaPerfilUsuario({Key? key}) : super(key: key);

  @override
  _PantallaPerfilUsuarioState createState() => _PantallaPerfilUsuarioState();
}

class _PantallaPerfilUsuarioState extends State<PantallaPerfilUsuario>{

  GestorUsuario gestor = GestorUsuario.instance;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mi perfil"),
          actions: [

            /// Botón de Logout
            Container(
              decoration: BoxDecoration(
                  color: enfadado,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                child: const Text("Cerrar Sesión", style: TextStyle(color: Colors.white,)),
                onPressed: (){
                  _alertaCerrarSesion();
                },
              ),
            ),
          ],

        ),
        body: Container(
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(20)
          ),
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// Nombre del usuario
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: "Nombre de usuario",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: gestor.currentUser!.user,
                        hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold,
                          color: black,
                        )
                    ),
                  ),
                ),

                const Text("Estadísticas: ",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                /// Apartado de categorias "Mediables"
                const Text("Medias: ",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                /// Texto generado a partir de las estadísicas
                /// todo esto hay que tocarlo mucho para que saque las categorias el valor y tal
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),


                /// Apartado de categorias min/max
                const SizedBox(height: 8),
                const Text("Min-Max: ",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
                buildTextoEstadisticas("categoria", "X"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTextoEstadisticas(String categoria, String stat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Text(categoria + ": ",
            style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(stat,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }



  /// Función que muestra una alerta para asegurarse de si se quiere cerrar sesión
  Future <void> _alertaCerrarSesion() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás segurx?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Vas a cerrar sesión, ¿de verdad quieres hacerlo?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Cerrar sesión"),
                onPressed: () {
                  GestorUsuario.instance.cerrarSesion();

                  // esto hace que se borre toda la pila y no se pueda volver hacia atrás una vez pulsado este botón
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Login()), (r) => false);
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