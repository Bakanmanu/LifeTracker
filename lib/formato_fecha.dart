
/// Esta clase sirve para gestionar lo relacionado con el formato de visualización
/// de las fechas. En principio no se pretende desarrollar mucho ya que es una funcionalidad
/// totalmente secundaria, pero se deja creada por posible escalabilidad y buena separación
/// de las responsabilidades. Ya que el método principal no puede pertenecer a ninguna otra
/// clase de las ya creadas.
/// Todos los métodos son static porque no hace falta instancializar esta clase
///
/// Posibles futuros métodos puede ser, por ejemplo, crear una clase/página que permita
/// configurar el formato de fecha deseado (habría que hacer uno a uno los métodos)
/// O elegir si quieres poner el mes como número o por su nombre

class FormatoFecha {

  static const String separadorDiag = '/';
  static const String separadorHoriz = '-';

  static String separador = separadorDiag;

  static String getFecha_ES_DDMMYYYY_hhmm(DateTime fecha){

    String fechaFormat = getDiaSemana(fecha);

    fechaFormat += getDDMMYYYY(fecha);

    fechaFormat += getHHMM(fecha);

    return fechaFormat;
  }

  static String getHHMM(DateTime fecha) {
    String hora = '';

    if(fecha.hour < 10){
      hora += '0' + fecha.hour.toString() + ':';
    } else {
      hora += fecha.hour.toString() + ':';
    }

    if(fecha.minute < 10){
      hora += '0' + fecha.minute.toString() + ':';
    } else {
      hora += fecha.minute.toString() + ':';
    }

    if(fecha.second < 10){
      hora += '0' + fecha.second.toString();
    } else {
      hora += fecha.second.toString();
    }

    return hora;
  }

  static String getDiaSemana(DateTime fecha){
    String dia = '';
    switch (fecha.weekday){
      case 1: dia += 'Lunes, '; break;
      case 2: dia += 'Martes, '; break;
      case 3: dia += 'Miércoles, '; break;
      case 4: dia += 'Jueves, '; break;
      case 5: dia += 'Viernes, '; break;
      case 6: dia += 'Sábado, '; break;
      case 7: dia += 'Domingo, '; break;
    }
    return dia;
  }

  static String getDDMMYYYY(DateTime fecha){
    String fechaFormat = fecha.day.toString() + '/';
    fechaFormat += fecha.month.toString() + '/';
    fechaFormat += fecha.year.toString() + ' ';

    return fechaFormat;
  }


  static void setSeparadorBarra(){
    separador = separadorHoriz;
  }

  static void setSeparadorDiagonal(){
    separador = separadorDiag;
  }

}