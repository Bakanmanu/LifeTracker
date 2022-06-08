import 'package:flutter/material.dart';
import 'package:life_tracker/funcionalidad/usuario.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_menu.dart';
import 'package:life_tracker/theme/colors.dart';
import 'package:smiley_ui/smiley_ui.dart';
import "../funcionalidad/categoria.dart";
import '../funcionalidad/formulario.dart';

/// Este fichero sirve para crear la parte gráfica a la hora de crear
/// un nuevo formulario. Por ello, se relacionará directamente con el fichero
/// formulario.dart

class PantallaFormulario extends StatefulWidget {
  const PantallaFormulario({Key? key}): super(key: key);
  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}


class _PantallaFormularioState extends State<PantallaFormulario> {

  GestorFormulario gestor = GestorUsuario.instance.currentUser!.gestorFormulario; // todo revisar

  ///Estos atributos sirven para guardar y enviar el estado del formulario definitivamente
  late int _estadoAnimo; //Valor por defecto: estado de ánimo neutral
  late List<Categoria> _categorias;
  late String _campoTexto = ''; //siempre va a haber un campo de texto, aunque esté vacío

  _PantallaFormularioState(){

    if (gestor.isModificar){ /// MODIFICAR UN FORMULARIO
      // Recuperamos los campos del formulario
      _estadoAnimo = gestor.getFormEditar().estadoAnimo;
      _categorias = gestor.getFormEditar().listaCategorias; // todo revisar para que se haga una copia y no se pase por referencia
      _campoTexto = gestor.getFormEditar().campoTexto;
    }
    else{ /// CREAR UN FORMULARIO
      // Generamos los valores por defecto
      _estadoAnimo = 3;
      _categorias = gestor.generateCategorias();
      _campoTexto = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
        title: gestor.isModificar ? const Text('Modificar formulario') : const Text('Nuevo formulario'),
        actions: [
          /// Este botón se encarga de crear o actualizar los formularios (y estadísticas)
          generarBotonEnvio(),
        ],
      ),
      body:
        Column(
          children: <Widget>[
            // Generamos los distintos campos del formulario

            generarTablaEstadoAnimo(),
            // generarTablaEstadoAnimo2(),
            generarCategorias(),
            generarCampoTexto()
          ],
        ),

      /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
      //floatingActionButton: generarBotonEnvio(),
    );
  }


  /// Método para generar las caras animadas para el estado de ánimo
  /// FUENTE: https://github.com/TesteurManiak/bastiui_smileys
  Widget generarTablaEstadoAnimo() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return
      SizedBox(
        height: queryData.size.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmileyWidget(
              expression: SmileyExpression.verySad,
              isEnabled:  _estadoAnimo == 1 ? true : false,
              isSelected: _estadoAnimo == 1 ? true : false,
              onTap: () => setState(
                    () {
                  _estadoAnimo = 1;
                },
              ),
            ),

            SmileyWidget(
              expression: SmileyExpression.sad,
              isEnabled:  _estadoAnimo == 2 ? true : false,
              isSelected: _estadoAnimo == 2 ? true : false,
              onTap: () => setState(
                    () {
                  _estadoAnimo = 2;
                },
              ),
            ),

            SmileyWidget(
                expression: SmileyExpression.neutral,
              isEnabled:  _estadoAnimo == 3 ? true : false,
              isSelected: _estadoAnimo == 3 ? true : false,
              onTap: () => setState(
                    () {
                  _estadoAnimo = 3;
                },
              ),
            ),

            SmileyWidget(
              expression: SmileyExpression.happy,
              isEnabled:  _estadoAnimo == 4 ? true : false,
              isSelected: _estadoAnimo == 4 ? true : false,
              onTap: () => setState(
                    () {
                  _estadoAnimo = 4;
                },
              ),
            ),

            SmileyWidget(
              expression: SmileyExpression.veryHappy,
              isEnabled:  _estadoAnimo == 5 ? true : false,
              isSelected: _estadoAnimo == 5 ? true : false,
              onTap: () => setState(
                    () {
                  _estadoAnimo = 5;
                },
              ),
            ),
          ],
        ),
      );
  }

  /// MÉTODO PARA GENERAR LA BARRA DE ESTADO DE ANIMO ANTIGUA
  /// deprecated
  // Widget generarTablaEstadoAnimo2() {
  //   return Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           _icon(0, text: "Enfadado", icon: Icons.sentiment_very_dissatisfied_rounded),
  //           _icon(1, text: "Triste", icon: Icons.sentiment_dissatisfied_rounded),
  //           _icon(2, text: "Neutral", icon: Icons.sentiment_neutral_rounded),
  //           _icon(3, text: "Contento", icon: Icons.sentiment_satisfied_alt_rounded),
  //           _icon(4, text: "Feliz", icon: Icons.sentiment_very_satisfied_rounded),
  //         ],
  //       );
  // }

  /// MÉTODO ADICIONAL RELACIONADO CON generarTablaEstadoAnimo2 para marcar o desmarcar botones de estado de ánimo
  /// deprecated
  // Widget _icon(int index, {required String text, required IconData icon}) {
  //   MediaQueryData queryData;
  //   queryData = MediaQuery.of(context);
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(0, queryData.size.height/50, 0, 0), // padding para que no se muestre pegado a la appBar
  //     child: InkResponse(
  //       child: Column (
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             icon,
  //             color: _estadoAnimo == index+1 ? Colors.red : null, // esto es lo que hace que sean botones exclusivos
  //           ),
  //           Text(text, style: TextStyle(color: _estadoAnimo == index+1 ? Colors.red : null)),
  //         ],
  //       ),
  //       onTap: () => setState(
  //             () {
  //               print("click en "+estadosAnimo[index].nombre); // DEBUG
  //               _estadoAnimo = index+1;
  //         },
  //       ),
  //     ),
  //   );
  // }

  /// MÉTODO PARA GENERAR LAS CATEGORÍAS Y ACCIONES
  Widget generarCategorias() {
    /// Selección del color para el fondo del formulario
    late Color color;
    switch(_estadoAnimo){
      case 1: color = enfadado; break;
      case 2: color = triste;   break;
      case 3: color = neutral;  break;
      case 4: color = feliz;    break;
      case 5: color = contento; break;
    }

    return Flexible(
      child:
      SafeArea(
        child:
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              //margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 0),
              child:
                Column(
                  children: List.generate(
                    _categorias.length,
                        (indexCategorias){
                      Categoria categoria = _categorias[indexCategorias];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// Enunciado
                          Text(categoria.enunciado,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: color)
                          ),

                          /// Lista de acciones
                          Container(
                            //Decoración
                            margin: const EdgeInsets.only(bottom: 15, top: 5),
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: color, width: 2)
                            ),

                            child: Wrap(
                              children: List.generate(
                                  categoria.acciones.length,
                                      (indexAcciones){
                                    return Row(
                                      children: [
                                        Checkbox( // todo revisar a ver si se puede cambiar que sea un Checkbox
                                          value: categoria.acciones[indexAcciones].activo,

                                          // Decoración
                                          activeColor: color,
                                          shape: const ContinuousRectangleBorder(),
                                          // Funcionalidad
                                          onChanged: (value){
                                            setState(() {
                                              // todo revisar para que se guarde cuando le des al botón, porque ahora se guarda automáticamente
                                              categoria.acciones[indexAcciones].cambiarActivo(); //Cambiamos el estado de la acción al hacer click
                                            });
                                          },
                                        ),
                                        Text(categoria.acciones[indexAcciones].nombre,
                                            style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                color: color))
                                      ],
                                    );
                                  }),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  /// MÉTODO PARA GENERAR EL CAMPO DE TEXTO
  Widget generarCampoTexto() {
    return Container(
      //margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      child: TextFormField(
        key: const Key("addTexto"),
        initialValue: _campoTexto, // Si _campoTexto == '', entonces no pondrá valor incial, si no, pondrá lo que esté guardado
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Cuenta aquí qué tal te ha ido el día',
        ),
        onChanged: (String textoEscrito){
          _campoTexto = textoEscrito;
        },
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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const PantallaMenu()), (r) => false);
          //Navigator.pop(context, MaterialPageRoute(builder: (_)=>const PantallaMostrarFormulario()));
        }
        else{ /// CREAR UN FORMULARIO
          gestor.crearFormulario(_estadoAnimo, _categorias, _campoTexto);
          await _mostrarAlertaFormCorrecto(); //Botón de alerta para notificar que el form se ha creado correctamente

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const PantallaMenu()), (r) => false);
          //Navigator.pop(context, MaterialPageRoute(builder: (_)=>const PantallaMenu()));
        }

        /// Cada vez que haya cambios en los formularios, actualizamos las estadísticas
        GestorUsuario.instance.currentUser?.actualizarEstadisticas();
      },
      /// AQUÍ HAY UNA ELECCIÓN DE CREAR O MODIFICAR
      child: gestor.isModificar ? const Text('Guardar',) : const Text('Crear'),
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