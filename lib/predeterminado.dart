import 'accion.dart';

/// Esta clase sirve para la utilidad general de la aplicación, clase inicializadora
/// como, por ejemplo, implementar un secuenciador o establecer
/// el paquete de acciones predeterminado

abstract class Predeterminado { //todo revisar si tiene que ser clase abstracta o si hay que hacer un Singleton
  int secuenciador = 0;
  List<Accion>? listaAccionesDefault; //todo quitar el nullable ("?")

  void incrementarSeq(){
    secuenciador++;
  }

  int getSeq() => secuenciador;

}