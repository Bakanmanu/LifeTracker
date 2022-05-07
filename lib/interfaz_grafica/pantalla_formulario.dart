import 'package:flutter/material.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_menu.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_mostrar_formularios.dart';
import 'package:smiley_ui/smiley_ui.dart';
import "../funcionalidad/categoria.dart";
import '../funcionalidad/elementos_estado_animo.dart';
import '../funcionalidad/formulario.dart';
import '../theme/colors.dart';

/// Este fichero sirve para crear la parte gráfica a la hora de crear
/// un nuevo formulario. Por ello, se relacionará directamente con el fichero
/// formulario.dart

class PantallaFormulario extends StatefulWidget {
  const PantallaFormulario({Key? key}): super(key: key);
  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}


class _PantallaFormularioState extends State<PantallaFormulario> {

  late GestorFormulario gestor = GestorFormulario.instance;

  ///Estos atributos sirven para guardar y enviar el estado del formulario definitivamente
  late int _estadoAnimo; //Valor por defecto: estado de ánimo neutral
  late List<Categoria> _categorias;
  late String _campoTexto = ''; //siempre va a haber un campo de texto, aunque esté vacío

  _PantallaFormularioState(){

    if (gestor.isModificar){ /// MODIFICAR UN FORMULARIO
      // Recuperamos los campos del formulario
      _estadoAnimo = gestor.getFormEditar().estadoAnimo;
      _categorias = gestor.getFormEditar().listaCategorias;
      _campoTexto = gestor.getFormEditar().campoTexto;
    }
    else{ /// CREAR UN FORMULARIO
      // Generamos los valores por defecto
      _estadoAnimo = 3;
      _categorias = gestor.generateCategorias();
      _campoTexto = '';
    }
  }

  /// Getter
  List<Categoria> get categorias => _categorias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
        title: gestor.isModificar ? const Text('Modificar formulario') : const Text('Nuevo formulario'),
        backgroundColor: appBarColor, //todo cambiar color en theme
      ),
      backgroundColor: background, //todo cambiar color
      body:
        Column(
          children: <Widget>[
            // Generamos los distintos campos del formulario

            generarTablaEstadoAnimo2(),
            generarTablaEstadoAnimo(), //todo cambiar
            generarCategorias(),
            generarCampoTexto(),
          ],
        ),

      /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
      floatingActionButton: generarBotonEnvio(),
    );
  }


  /// PRUEBAS
  Widget generarTablaEstadoAnimo2() { // todo poner mas bonito y hacer iconos un poco más grandes
    return const SmileyWidget(
      expression: SmileyExpression.veryHappy,
    );
  }

  /// MÉTODO PARA GENERAR LA BARRA DE ESTADO DE ANIMO
  Widget generarTablaEstadoAnimo() { // todo poner mas bonito y hacer iconos un poco más grandes
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _icon(0, text: "Enfadado", icon: Icons.sentiment_very_dissatisfied_rounded), // todo intentar poner las imagenes en vez de iconos
            _icon(1, text: "Triste", icon: Icons.sentiment_dissatisfied_rounded),
            _icon(2, text: "Neutral", icon: Icons.sentiment_neutral_rounded),
            _icon(3, text: "Contento", icon: Icons.sentiment_satisfied_alt_rounded),
            _icon(4, text: "Feliz", icon: Icons.sentiment_very_satisfied_rounded),
          ],
        );
  }

  Widget _icon(int index, {required String text, required IconData icon}) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, queryData.size.height/50, 0, 0), // padding para que no se muestre pegado a la appBar todo ajustar
      child: InkResponse(
        child: Column (
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _estadoAnimo == index+1 ? Colors.red : null, // esto es lo que hace que sean botones exclusivos //todo cambiar color
            ),
            Text(text, style: TextStyle(color: _estadoAnimo == index+1 ? Colors.red : null)), // todo hacer que el color se quede según el animo
          ],
        ),
        onTap: () => setState(
              () {
                print("click en "+estadosAnimo[index].nombre); // DEBUG
                _estadoAnimo = index+1;
          },
        ),
      ),
    );
  }


  /// MÉTODO PARA GENERAR LAS CATEGORÍAS Y ACCIONES
  Widget generarCategorias() {
    return Flexible(
      child:
      SafeArea(
        child:
        ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15),), //todo cambiar color
              child:
              Column(
                children: List.generate(
                  _categorias.length,
                      (indexCategorias){
                    final categoria = _categorias[indexCategorias];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categoria.enunciado, style: const TextStyle(color: Colors.white, fontSize: 20),),//todo cambiar color
                        const SizedBox(height: 15,),
                        Wrap(
                          children: List.generate(
                              categoria.acciones.length,
                                  (indexAcciones){
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: categoria.acciones[indexAcciones].activo,
                                      onChanged: (value){
                                        setState(() {
                                          categoria.acciones[indexAcciones].cambiarActivo(); //Cambiamos el estado de la acción al hacer click
                                        });
                                      },
                                      activeColor: Colors.deepPurple, //todo cambiar color
                                    ),
                                    Text(categoria.acciones[indexAcciones].nombre, style: const TextStyle(color: Colors.black, fontSize: 16)), //todo cambiar color
                                  ],
                                );
                              }),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// MÉTODO PARA GENERAR EL CAMPO DE TEXTO
  Widget generarCampoTexto() {

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 60),
      child:
      Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius: BorderRadius.circular(15),), //todo cambiar color
        child: TextFormField(
          key: const Key("addTexto"),
          initialValue: _campoTexto, // Si _campoTexto == '', entonces no pondrá valor incial, si no, pondrá lo que esté guardado
          decoration: const InputDecoration(
            fillColor: Colors.white, //todo cambiar color
            border: OutlineInputBorder(),
            labelText: 'Cuenta aquí qué tal te ha ido el día',
          ),
          onChanged: (String textoEscrito){
            _campoTexto = textoEscrito;
          },
        ),
      ),
    );
  }

  /// MÉTODO PARA GENERAR EL BOTÓN DE ENVÍO (CREAR O MODIFICAR)
  Widget generarBotonEnvio(){
    return ElevatedButton(
      onPressed: () async {
        if (gestor.isModificar){ /// MODIFICAR UN FORMULARIO
          gestor.editarFormulario(_estadoAnimo, _categorias, _campoTexto);
          await _mostrarAlertaFormCorrecto(); //Botón de alerta para notificar que el form se ha creado correctamente
          Navigator.pop(context, MaterialPageRoute(builder: (_)=>const PantallaMostrarFormulario()));
        }
        else{ /// CREAR UN FORMULARIO
          gestor.crearFormulario(_estadoAnimo, _categorias, _campoTexto);
          await _mostrarAlertaFormCorrecto(); //Botón de alerta para notificar que el form se ha creado correctamente
          Navigator.pop(context, MaterialPageRoute(builder: (_)=>const PantallaMenu()));
        }
      },
      /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
      child: gestor.isModificar ? const Text('Guardar formulario') : const Text('Crear formulario'),
    );
  }

  /// Esta función genera una alerta emergente para notificar de que el formulario se ha guardado
  Future <void> _mostrarAlertaFormCorrecto() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('El formulario se ha guardado correctamente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Para borrarlo o modificarlo, ve a "Buscar formulario" '
                    'en el Menú'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Gracias :)'),
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