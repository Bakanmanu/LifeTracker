import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_perfil.dart';
import 'package:life_tracker/theme/colors.dart';
import '../funcionalidad/formulario.dart';
import '../funcionalidad/usuario.dart';

class PantallaTabs extends StatefulWidget {
  const PantallaTabs({Key? key}) : super(key: key);

  @override
  _PantallaTabsState createState() => _PantallaTabsState();
}


/// Esta clase se encarga de generar una interfaz distinta a la de pantalla_menu
/// ya que utiliza pestañas con toda la información cargada
class _PantallaTabsState extends State<PantallaTabs> {
  GestorFormulario gestor =
      GestorUsuario.instance.currentUser!.gestorFormulario;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

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
        bottomNavigationBar: const TabBar(
          indicator: BoxDecoration(color: primary),
          automaticIndicatorColorAdjustment: true,
          tabs: [
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.manage_accounts)),
          ],
        ),

        /// BODY 2
        body: const TabBarView(
          children: [
            PantallaMostrarFormulario(), // todo revisar
            PantallaPerfilUsuario()
          ],
        ),

      ),
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
