import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/main.dart';

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
          appBar: AppBar(title: const Text("Configuración"),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // todo poner más bonito
                Text("Username:\n" + gestor.currentUser!.user, style: const TextStyle(color: Colors.white, fontSize: 20),),

                // todo hacer botón para cambiar los datos

                Container(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 15),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(
                    child: const Text("Cerrar Sesión", style: TextStyle(color: Colors.white, fontSize: 20),),
                    onPressed: (){
                      _alertaCerrarSesion();
                    },
                  ),
                ),



              ],
            ),
          )
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
                Text("Vas a cerrar sesión. ¿de verdad quieres hacerlo?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Cerrar sesión"),
                onPressed: () {
                  GestorUsuario.instance.cerrarSesion();

                  // esto hace que se borre toda la pila y no se pueda volver hacia atrás una vez pulsado este botón
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Inicio()), (r) => false);
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