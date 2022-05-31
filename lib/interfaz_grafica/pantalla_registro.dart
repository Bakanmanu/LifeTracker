import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_login.dart';
import 'package:life_tracker/deprecated/pantalla_menu_old.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_menu.dart';

///Este fichero sirve para que un usuario pueda registrarse

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({Key? key}) : super(key: key);

  @override
  _PantallaRegistroState createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {

  GestorUsuario gestor = GestorUsuario.instance;
  String user = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, //todo poner color
      body: Container(
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0)
            )
            ],
            color: Colors.purpleAccent, //todo poner color
            borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// MENSAJE todo poner más bonito
              if (MediaQuery.of(context).viewInsets.bottom == 0) Column(
                children: [
                   // si el teclado NO está activo
                      Container(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: const Icon(Icons.login, size: 120,)
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: const Text("Introduce tus datos para crear una nueva cuenta",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                ],
              ),

              /// CAMPO USERNAME
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                // todo revisar responsive
                child: TextFormField(
                  key: const Key("addTexto"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de usuario',
                  ),
                  onChanged: (String userInput) {
                    user = userInput;
                  },
                ),
              ),

              /// CAMPO PASSWORD
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
                // todo revisar responsive
                child: TextFormField(
                  obscureText: true,
                  key: const Key("addTexto"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                  onChanged: (String passInput) {
                    pass = passInput;
                  },
                ),
              ),

              /// BOTÓN CREAR CUENTA
              Container(
                margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 15),
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.deepPurple, //todo poner color
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: const Text("Crear cuenta",
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: () {
                    //todo revisar cuando la API
                    int codigoReg = gestor.registrarse(user, pass); // intento de inicio de sesión
                    if (codigoReg == 1) { // REGISTRO CORRECTO
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const PantallaMenu()), (route) => false,); // todo revisar ruta
                    }
                    else { // FALLO AL REGISTRO
                      _mostrarAlerta(codigoReg);
                    }
                  },
                ),
              ),

              /// BOTÓN REGISTRAR
              GestureDetector(
                child: const Text("¿Ya tienes una cuenta? Inicia sesión"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future <void> _mostrarAlerta(int codigo) async {
    String texto = '';

    switch (codigo) {
      case 0:
        texto = "El usuario introducido ya existe. Pruebe con otro";
        break;
      case 1:
        texto = "Cuenta creada con éxito :)";
        break;
      case 2:
        texto = "La contraseña no es válida. Prueba con otra anda";
        break;
      case 3:
        texto = "Por favor, rellene los campos";
        break;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oye!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(texto),
              ],
            ),
          ),
          actions: <Widget>[
            if (codigo == 0) ( // si el nombre de usuario existe
                TextButton(
                  child: const Text('Iniciar sesión'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                )
            ),

            TextButton(
              child: const Text('Vale'),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
