import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_perfil.dart';
import 'package:life_tracker/theme/colors.dart';
import '../funcionalidad/formulario.dart';
import '../funcionalidad/usuario.dart';

class PantallaMenu extends StatefulWidget {
  const PantallaMenu({Key? key}) : super(key: key);

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}


/// Esta clase se encarga de generar una interfaz distinta a la de pantalla_menu
/// ya que utiliza pestañas con toda la información cargada
class _PantallaMenuState extends State<PantallaMenu> {
  GestorFormulario gestor =
      GestorUsuario.instance.currentUser!.gestorFormulario;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        // backgroundColor: Colors.transparent,
        // extendBody: true,

        /// FLOATING ACTION BUTTON (para crear formularios
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            irNuevoFormulario();
            setState(() {});
          },
          tooltip: 'Nuevo formulario',
          child: const Icon(Icons.add),
        ),

        /// BOTTOM NAVIGATION BAR
        bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: primary,
          child: TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.manage_accounts)),
            ],
          ),
        ),

        /// BODY
        body: const TabBarView(
          children: [
            PantallaMostrarFormulario(),
            PantallaPerfilUsuario()
          ],
        ),
      ),
    );
  }

  Future irNuevoFormulario() {
    return Navigator.push(context, MaterialPageRoute(builder: (_) {
      gestor.setStratCrear();
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
