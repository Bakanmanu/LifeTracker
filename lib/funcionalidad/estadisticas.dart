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
  String mediaEstadoAnimoStr  = "";
  double mediaEstadoAnimo     = 0;
  double mediaSueno           = 0;
  double mediaCalidadSueno    = 0;
  double mediaAutoestima      = 0;
  double mediaProductividad   = 0;

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

    //todo IMPORTANTE: intentar hacer que cada método getLokesea sea el que
    //actualice el atributo y el mapa
    actualizarNumFormularios(listaF);
    actualizarMediaEstadoAnimo(listaF);
    // mediaSueno          = 0;
    // mediaCalidadSueno   = 0;
    // mediaAutoestima     = 0;
    // mediaProductividad  = 0;

    // minQuehaceres;
    // maxQuehaceres;
    // minComida;
    // maxComida;
    // minEntretenimiento;
    // maxEntretenimiento;
    // minTiempo;
    // maxTiempo;

    _actualizarMapas(); //Actualizamos los mapas para poder mostrar los cambios
  }

  void _actualizarMapas(){
    mapaMediables["Estado de ánimo"]  = mediaEstadoAnimoStr + " (" + mediaEstadoAnimo.toStringAsFixed(1) + "/5)";
    mapaMediables["Horas de sueño"]   = mediaSueno.toString();
    mapaMediables["Calidad de sueño"] = mediaCalidadSueno.toString();
    mapaMediables["Autoestima"]       = mediaAutoestima.toString();
    mapaMediables["Productividad"]    = mediaProductividad.toString();

    mapaMinMax["Mínimo Quehaceres"]       = minQuehaceres.toString();
    mapaMinMax["Máximo Quehaceres"]       = maxQuehaceres.toString();
    mapaMinMax["Mínimo Comida"]           = minComida.toString();
    mapaMinMax["Máximo Comida"]           = maxComida.toString();
    mapaMinMax["Mínimo Entretenimiento"]  = minEntretenimiento.toString();
    mapaMinMax["Máximo Entretenimiento"]  = maxEntretenimiento.toString();
    mapaMinMax["Mínimo Tiempo"]           = minTiempo.toString();
    mapaMinMax["Máximo Tiempo"]           = maxTiempo.toString();
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
      for (var element in listForm) {
        suma += element.estadoAnimo;
      }
      media = suma/nFormularios;
    }
    mediaEstadoAnimo = media;
    mediaEstadoAnimoStr = estadosAnimo[media.round()-1].nombre;
  }
  double getMediaSueno(List<Formulario> listForm){
    double media = 0;
    return 0;
  }
  double getMediaCalidadSueno(List<Formulario> listForm){
    double media = 0;
    return 0;
  }
  double getMediaAutoestima(List<Formulario> listForm){
    double media = 0;
    return 0;
  }
  double getProductividad(List<Formulario> listForm){
    double media = 0;
    return 0;
  }
}