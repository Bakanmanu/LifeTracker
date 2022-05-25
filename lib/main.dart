import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_registro.dart';
import 'package:life_tracker/theme/colors.dart';
import 'interfaz_grafica/pantalla_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Tracker',
      debugShowCheckedModeBanner: false,
      theme: //ThemeData.dark(),
      ThemeData(
        primarySwatch: Colors.purple, //todo aqui hay que hacer el theme y especificar los colores por defecto
        scaffoldBackgroundColor: background, //todo ajustar el color
        //backgroundColor: background,
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget{
  const Inicio({Key? key}) : super(key: key);

  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio>{

  GestorUsuario gestor = GestorUsuario.instance;
  String user = '';
  String pass = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple, //todo poner color
      body: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(5.0, 5.0)
            )],
          color: Colors.purpleAccent, //todo poner color
          borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20 ,bottom: 40),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// LOGO
              Container(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
                  child: Image.asset("assets/logo_transparent.png", height: 230,)
              ),

              /// CAMPO USERNAME
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10), // todo revisar responsive
                child: TextFormField(
                  key: const Key("addTexto"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de usuario',
                  ),
                  onChanged: (String userInput){
                    user = userInput;
                  },
                ),
              ),

              /// CAMPO PASSWORD
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15), // todo revisar responsive
                child: TextFormField(
                  obscureText: true,
                  key: const Key("addTexto"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                  onChanged: (String passInput){
                    pass = passInput;
                  },
                ),
              ),

              /// BOTÓN COMENZAR
              Container(
                margin: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple, //todo poner color
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: const Text("Comenzar", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: (){
                    print("BOTON PULSADO");
                    print(user);
                    print(pass);
                    print(gestor.iniciarSesion(user, pass));
                    if (gestor.iniciarSesion(user, pass) == 0){ //todo revisar cuando la API
                      // todo poner alerta de credenciales erróneas
                      // avisar de que el usuario no existe y sugerir registrarse
                    }
                    else if (gestor.iniciarSesion(user, pass) == 1){
                      // todo poner un mensaje de inicio de sesión correcto
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaMenu()));
                    }
                    else if (gestor.iniciarSesion(user, pass) == 2){
                      // todo poner alerta de credenciales erróneas (user existe pero contraseña mal)
                      //pass.;
                    }
                  },
                ),
              ),

              /// BOTÓN REGISTRAR
              GestureDetector(
                child: const Text("¿Eres nuevo? Registrate aquí"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const PantallaRegistro()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future <void> _mostrarAlerta(int codigo) async { //todo
    String texto = '';

    switch (codigo){
      case 0:
        texto = "El usuario no existe";
        break;
      case 1:
        texto = "Inicio de sesión correcto :)";
        break;
      case 2:
        texto = "Las credenciales no son válidas";
        break;
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('El formulario se ha guardado correctamente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("texto"), ///todo poner variable texto
              ],
            ),
          ),
          actions: <Widget>[
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

