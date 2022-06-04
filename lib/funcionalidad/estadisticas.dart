import 'package:life_tracker/funcionalidad/accion.dart';
import 'package:life_tracker/funcionalidad/elementos_estado_animo.dart';
import 'package:life_tracker/funcionalidad/formulario.dart';

/// Clase que gestiona lo relacionado con las estadísticas de usuario para
/// facilitar la recopilación de datos en la BD y mostrar las estadisticas
/// del propio usuario
class Estadisticas {

  int nFormularios          = 0;
  Map <String, String> mapaMediables = {
    "Estado de ánimo" : "-",
    "Horas de sueño" : "-",
    "Calidad de sueño" : "-",
    "Autoestima" : "-",
    "Productividad" : "-",
    "Horas de deporte":"-",
  };
  Map <String, String> mapaMinMax = {
    "Mínimo Quehaceres" : "-",
    "Máximo Quehaceres" : "-",
    "Mínimo Comida" : "-",
    "Máximo Comida" : "-",
    "Mínimo Entretenimiento" : "-",
    "Máximo Entretenimiento" : "-",
    "Mínimo Tiempo" : "-",
    "Máximo Tiempo" : "-",
  };

  /// Atributos referentes a valores "mediables"
  /// mediaEstadoAnimo es String porque se redondea el valor al estado
  /// discreto más cercano
  /// Valores negativos significa que no hay datos
  String mediaEstadoAnimoStr  = "";
  double mediaEstadoAnimo     = 0;
  double mediaSueno           = 0;
  double mediaCalidadSueno    = 0;
  double mediaAutoestima      = 0;
  double mediaProductividad   = 0;
  double mediaHorasDeporte    = 0;

  /// Atributos referentes a valores mínimos/máximos
  String minQuehaceres = "";
  String maxQuehaceres = "";
  String minComida = "";
  String maxComida = "";
  String minEntretenimiento = "";
  String maxEntretenimiento = "";
  String minTiempo = "";
  String maxTiempo = "";

  // todo métodos:
  /*
      Calcular el número de formularios
      Calcular la media de ánimo
      Calcular la media de cada categoría mesurable
      De las categorías múltiples: calcular lo que más y lo que menos

     */

  void actualizarEstadisticas(List <Formulario> listaF){
    actualizarNumFormularios(listaF);

    actualizarMediaEstadoAnimo(listaF);
    actualizarMediaSueno(listaF);
    actualizarMediaCalidadSueno(listaF);
    actualizarMediaAutoestima(listaF);
    actualizarMediaProductividad(listaF);
    actualizarMediaDeporte(listaF);

    actualizarMinMaxQuehaceres(listaF);
    actualizarMinMaxComida(listaF);
    actualizarMinMaxEntretenimiento(listaF);
    actualizarMinMaxTiempo(listaF);

    _actualizarMapas(); //Actualizamos los mapas para poder mostrar los cambios
  }

  void _actualizarMapas(){

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)'); // para quitar .0 en números ( 5.0 -> 5)

    if (mediaEstadoAnimo != -1){
      mapaMediables["Estado de ánimo"] =
          mediaEstadoAnimoStr + " (" + mediaEstadoAnimo.toStringAsFixed(1).replaceAll(regex, '') + "/5)";
    } else {mapaMediables["Estado de ánimo"] = "Sin datos";}

    if (mediaSueno != -1) {
      mapaMediables["Horas de sueño"] =
          mediaSueno.toStringAsFixed(1).replaceAll(regex, '') + "h aprox.";
    } else {mapaMediables["Horas de sueño"] = "Sin datos";}

    if(mediaCalidadSueno != -1){
      mapaMediables["Calidad de sueño"] =
          mediaCalidadSueno.toStringAsFixed(1).replaceAll(regex, '') + "/4";
    } else {mapaMediables["Calidad de sueño"] = "Sin datos";}

    if(mediaAutoestima != -1) {
      mapaMediables["Autoestima"] =
          mediaAutoestima.toStringAsFixed(1).replaceAll(regex, '') + "/5";
    } else {mapaMediables["Autoestima"] = "Sin datos";}

    if(mediaProductividad != -1) {
      mapaMediables["Productividad"] =
          mediaProductividad.toStringAsFixed(1).replaceAll(regex, '') + "/5";
    } else {mapaMediables["Productividad"] = "Sin datos";}

    if(mediaHorasDeporte != -1) {
      mapaMediables["Horas de deporte"] =
          mediaHorasDeporte.toStringAsFixed(1).replaceAll(regex, '') + "h aprox";
    } else {mapaMediables["Horas de deporte"] = "Sin datos";}

    mapaMinMax["Mínimo Quehaceres"]       = minQuehaceres;
    mapaMinMax["Máximo Quehaceres"]       = maxQuehaceres;
    mapaMinMax["Mínimo Comida"]           = minComida;
    mapaMinMax["Máximo Comida"]           = maxComida;
    mapaMinMax["Mínimo Entretenimiento"]  = minEntretenimiento;
    mapaMinMax["Máximo Entretenimiento"]  = maxEntretenimiento;
    mapaMinMax["Mínimo Tiempo"]           = minTiempo;
    mapaMinMax["Máximo Tiempo"]           = maxTiempo;
  }
  /// Método para obtener el número de formularios
  void actualizarNumFormularios(List<Formulario> listForm){
    nFormularios = listForm.length;
  }

  /// Este método guarda el String asociado al numero entero
  /// más cercano a la media obtenida, además de guardar el número
  /// sin redondear para dar más detalles
  void actualizarMediaEstadoAnimo(List<Formulario> listForm){
    double media = 0;
    if(nFormularios > 0){
      double suma = 0;
      for (Formulario f in listForm) {
        suma += f.estadoAnimo;
      }
      media = suma/nFormularios;

      mediaEstadoAnimo = media;
      mediaEstadoAnimoStr = estadosAnimo[media.round()-1].nombre;
    }
    else {
      mediaEstadoAnimo = -1; // -1 significa sin datos
      mediaEstadoAnimoStr = "";
    }
  }

  /// Este método guarda la media de sueño teniendo en cuenta el index de cada
  /// acción de la categoría ¿Cuánto has dormido?. Siendo el valor asociado
  /// a cada Acción uno intermedio (para 1-3, tenemos en cuenta 2)
  ///
  /// Si la categoría está vacía, no cuenta para la media.
  /// Si hay dos valores en un mismo form, se suman los valores y cuenta como uno
  ///
  /// Esto es porque si se rellenan varias horas en un día, se considera una
  /// siesta o un sueño partido, pero siguen siendo horas de sueño el mismo día
  ///
  /// todo mirar si es mejor dividir entre los días que han pasado o entre formularios
  void actualizarMediaSueno(List<Formulario> listForm){
    int counter = 0; // Contador por cada formulario con esta categoría rellena
    int suma = 0;

    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(0).isRespuestasVacio){
          counter++;
          for (Accion a in f.listaCategorias.elementAt(0).respuestas){
            suma += a.value;
          }
        }
      }
      if (counter > 0){
        mediaSueno = suma/counter;
      } else { // si hay formularios pero ninguno con esta categoria rellena
        mediaSueno = -1;
      }
    }
    else {
      mediaSueno = -1;
    }
  }

  /// Método que calcula la media de la calidad de sueño
  ///
  /// Si la categoría está vacía, no cuenta para la media.
  /// Si hay dos valores en un mismo form, cuentan como dos valores distintos
  void actualizarMediaCalidadSueno(List<Formulario> listForm){
    int counter = 0; // Contador por cada acción marcada
    int suma = 0;
    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(1).isRespuestasVacio){
          for (Accion a in f.listaCategorias.elementAt(1).respuestas){
            if (a.value != 0){ // si vale 0 es Dormir acompañado: ese dato no lo contamos
              counter++;
              suma += a.value;
            }
          }
        }
      }
      if (counter > 0){
        mediaCalidadSueno = suma/counter;
      } else { // si hay formularios pero ninguno con esta categoria rellena
        mediaCalidadSueno = -1;
      }
    }
    else {
      mediaCalidadSueno = -1;
    }
  }

  /// Método que calcula la media de la autoestima
  ///
  /// Si la categoría está vacía, no cuenta para la media.
  /// Si hay dos valores en un mismo form, cuentan como dos valores distintos
  void actualizarMediaAutoestima(List<Formulario> listForm){
    int counter = 0; // Contador por cada acción marcada
    int suma = 0;
    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(2).isRespuestasVacio){
          for (Accion a in f.listaCategorias.elementAt(2).respuestas){
            counter++;
            suma += a.value;
          }
        }
      }
      if (counter > 0){
        mediaAutoestima = suma/counter;
      } else { // si hay formularios pero ninguno con esta categoria rellena
        mediaAutoestima = -1;
      }
    }
    else {
      mediaAutoestima = -1;
    }
  }

  /// Método que calcula la media de la productividad
  ///
  /// Si la categoría está vacía, no cuenta para la media.
  /// Si hay dos valores en un mismo form, cuentan como dos valores distintos
  void actualizarMediaProductividad(List<Formulario> listForm){
    int counter = 0; // Contador por cada acción marcada
    int suma = 0;
    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(3).isRespuestasVacio){
          for (Accion a in f.listaCategorias.elementAt(3).respuestas){
            counter++;
            suma += a.value;
          }
        }
      }
      if (counter > 0){
        mediaProductividad = suma/counter;
      } else { // si hay formularios pero ninguno con esta categoria rellena
        mediaProductividad = -1;
      }
    }
    else {
      mediaProductividad = -1;
    }
  }

  /// Método que calcula la media de la calidad de sueño
  ///
  /// Si la categoría está vacía, no cuenta para la media.
  /// Si hay dos valores en un mismo form, se suman y cuenta como uno
  void actualizarMediaDeporte(List<Formulario> listForm){
    int counter = 0; // Contador por cada formulario con esta categoría rellena
    double suma = 0;

    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(4).isRespuestasVacio){
          counter++;
          for (Accion a in f.listaCategorias.elementAt(4).respuestas){
            suma += a.value/2; // value representa el doble del tiempo indicado
          }
        }
      }
      if (counter > 0){
        mediaHorasDeporte = suma/counter;
      } else { // si hay formularios pero ninguno con esta categoria rellena
        mediaHorasDeporte = -1;
      }
    }
    else {
      mediaHorasDeporte = -1;
    }
  }

  void actualizarMinMaxQuehaceres(List<Formulario> listForm){

    bool noData = true;

    // Lista con el número de veces que está marcada la acción [i]
    List<int> ocurrencias = [0, 0, 0, 0, 0, 0, 0];

    if(nFormularios > 0){
      for (Formulario f in listForm) {
        if(!f.listaCategorias.elementAt(5).isRespuestasVacio){
          noData = false;
          for (Accion a in f.listaCategorias.elementAt(5).respuestas){
            ocurrencias[a.value]++; // Se incrementa la posición equivalente
          }
        }
      }
      if (!noData){ // si sí hay formularios y hay datos en la categoría
        minQuehaceres = "Con datos";
        maxQuehaceres = "Con datos";
      }
    }
    else if (noData){ // si no hay formularios o no tienen datos de esta categoría
      minQuehaceres = "Sin datos";
      maxQuehaceres = "Sin datos";
    }

    print(ocurrencias);
  }

  void actualizarMinMaxComida(List<Formulario> listForm){
  }

  void actualizarMinMaxEntretenimiento(List<Formulario> listForm){
  }

  void actualizarMinMaxTiempo(List<Formulario> listForm){
  }
}