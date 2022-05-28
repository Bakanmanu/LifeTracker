import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_perfil.dart';
import '../funcionalidad/formulario.dart';
import '../funcionalidad/usuario.dart';
import '../theme/colors.dart';
import './elementos_menu.dart';

class PantallaMenu extends StatefulWidget {
  const PantallaMenu({Key? key}) : super(key: key);

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu> {
  GestorFormulario gestor =
      GestorUsuario.instance.currentUser!.gestorFormulario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APPBAR
      appBar: AppBar(
        title: const Text("MENÚ"),
        actions: [
          GestureDetector(
              onTap: () {
                irEditarPerfil();
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.manage_accounts,
                  color: Colors.black,
                  size: 50,
                ), // otros icons: account_circle / account_box / manage_accounts
              )),
        ],
      ),

      /// FLOATING ACTION BUTTON (para crear formularios
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          irNuevoFormulario();
        },
        tooltip: 'Nuevo formulario',
        child: const Icon(Icons.add),
      ),

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: primary,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // todo revisar si borrar
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width/3,
                child: IconButton(
                  tooltip: 'Buscar formularios',
                  icon: const Icon(Icons.search),
                  onPressed: () {},

                ),
              ),

              const Spacer(),

              SizedBox(
                width: MediaQuery.of(context).size.width/3,
                child: IconButton(
                  tooltip: 'Editar perfil',
                  icon: const Icon(Icons.manage_accounts),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),



      /// BODY (el resto del menú)
      // todo probar a poner directamente todos los formularios y un botón flotante de nuevo formulario
      body: GridView.builder(
          itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              //Decoration todo revisar
              child: GestureDetector(
                key: const Key("BotonesMenu"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/" + menu[index].imagen,
                      width: 80,
                    ),
                    Text(
                      '\n' + menu[index].nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // SWITCH PARA ACCEDER A LOS DISTINTOS MENÚS
                  switch (menu[index].id) {
                    case 1: //Caso de que sea para rellenar un nuevo formulario
                      irNuevoFormulario();
                      break;

                    case 2: //Caso de que sea para consultar los formularios
                      irVerFormularios();
                      break;

                    /// deprecated
                    // case 3: //Caso para editar el perfil, implementación en un futuro
                    //   Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaPerfilUsuario()));
                    //   break;

                    /// deprecated
                    // case 4: //Caso para gestionar categorías
                    //   Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaGestionarCategoria()));
                    //   break;
                  }
                },
              ),
            );
          }),
    );
  }

  Future irNuevoFormulario() {
    return Navigator.push(context, MaterialPageRoute(builder: (_) {
      //GestorFormulario.instance.setStratCrear(); // Ponemos la estrategia Crear //todo quitar de aqui
      gestor.setStratCrear(); // todo revisar
      return const PantallaFormulario();
    }));
  }

  Future irVerFormularios() {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaMostrarFormulario()));
  }

  Future irEditarPerfil() {
    return Navigator.push(context,MaterialPageRoute(builder: (_) => const PantallaPerfilUsuario()));
  }
}
