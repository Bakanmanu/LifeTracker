import 'package:flutter/material.dart';
import 'package:practica2_ds/pantallaMenu.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: _login(),
    );
  }
}
class _login extends StatefulWidget{
  @override
  __loginState createState() => __loginState();
}

class __loginState extends State<_login>{
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(5.0, 5.0)
            )],
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20 ,bottom: 40),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo_transparent.png", height: 230,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "username@correo.com"
                ),
              ),
              SizedBox(height: 40,),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password"
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: FlatButton(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PantallaMenu()));
                  },
                ),
              ),
              SizedBox(height: 80,),
              Text("¿Eres nuevo? Registrate aquí")
            ],
          ),
        ),
      ),
    );
  }
}

