import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/main.dart';

///Este fichero sirve para que un usuario pueda registrarse

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({Key? key}) : super(key: key);

  @override
  _PantallaRegistroState createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Registrarse"),
          ),
          body: Center(
            child: Column(
              children: [
                const Text("Página de Registro"),

                /// BOTÓN REGISTRAR
                GestureDetector(
                    child: const Text("¿Ya tienes cuenta? Inicia sesión"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          )),
    );
  }
}
