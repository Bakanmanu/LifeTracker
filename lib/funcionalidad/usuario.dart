import 'package:life_tracker/funcionalidad/usuario_api.dart';
import 'package:life_tracker/interfaz_grafica/pantalla_formulario.dart';

import 'estadisticas.dart';
import 'formulario.dart';

/// Clase para gestionar lo relacionado con los usuarios. Esta clase se
/// encarga de crear usuarios, almacenarlos, validarlos y poder acceder al
/// usuario que esté actualmente utilizando la aplicación
class GestorUsuario {
  Map<String, Usuario> mapaUsuarios = { // usamos un mapa para que sea más rápido
    "asdf": Usuario(0, "asdf", "1234"),
  }; // siempre inicializamos con un usuario por defecto

  Usuario? currentUser; // el usuario que esté actualmente verificado. Puede ser null

  ///SINGLETON PARA NO CREAR MÁS DE 1 INSTANCIA DEL GESTOR
  GestorUsuario._privateConstructor();
  static final GestorUsuario _instance = GestorUsuario._privateConstructor();
  static GestorUsuario get instance => _instance;

  // GestorUsuario() {
  //   currentUser = mapaUsuarios["admin"];
  // }

  /// Método para que un usuario que tenga previamente creada una cuenta
  /// pueda iniciar sesión y pasar a ser el usuario actual
  /// Se comprueba si el usuario existe. Si existe, se comprueba que la
  /// contraseña introducida coincide con la almacenada
  /// todo cambiar con API
  /// todo pensar si guardar los usuarios en la estructura y revisar si existe para agilizar el proceso
  /// todo hacer que se descarguen autmáticamente los datos si se ha logueado bien
  int iniciarSesion(String user, String pass) {

    // Hacer petición con user y pass a la API
    // Hacer gestión de código
    // Si el inicio es correcto (guardar ID), entonces llamar a la función que recupera
    // todos los formularios del user según ID
    // Poner el currentUser con el que se haya pasado
    // comprobar si existe en el mapa por si viene desde el registro

    int codigo = 0; // 0: usuario no existe / 1: inicio correcto / 2: credenciales inválidas / 3: campos vacíos
    if (mapaUsuarios.containsKey(user)) {
      // el usuario existe -> true
      if (mapaUsuarios[user]?.pass == pass) {
        codigo = 1; // correcto
        setCurrentUser(mapaUsuarios[
            user]); // no puede ser nulo porque ya hemos comprobado que existe
      } else {
        codigo = 2; // no coincide contraseña
      }
    } else {
      if (user == '' && pass == '') {
        codigo = 3; // campos vacíos
      } else {
        codigo = 0;
      } // no existe usuario
    }
    // todo ver si hay que poner rellenarFormularios()

    return codigo;
  }

  /// Método que permite crear un nuevo usuario
  /// Primero comprueba si el nombre de usuario es válido y que no se ha
  /// introducido una contraseña vacía
  int registrarse(String userName, String pass) {
    int codigo = 4; // 0: usuario ya existe / 1: correcto / 2: campo contraseña no válido / 3: user vacío / 4: unknown

    if (pass == '') {
      codigo = 2; // contraseña no válida por estar vacía
    } else if (userName == '') {
      codigo = 3; // el campo usuario está vacío
    }

    else { // si son campos válidos
      codigo = 1;
      mapaUsuarios[userName] = Usuario(0, userName, pass); // añadimos el nuevo usuario al mapa
      setCurrentUser(mapaUsuarios[userName]); // ponemos el currentUser para que no haya que iniciar sesión
      iniciarSesion(userName, pass); // todo revisar
    }
      // // LLAMAMOS A LA API
      // var recibido = GestorUsuarioAPI.registrarseAPI(userName, pass);
      // if (recibido == null) {print("recibido null"); return 4;} // error desconocido porque no debería dar null
      // if (recibido.runtimeType == Usuario){ // Si se ha devuelto tipo Usuario (creación correcta)
      //   codigo = 1;
      //   mapaUsuarios[userName] = recibido; // añadimos el nuevo usuario al mapa
      //   setCurrentUser(recibido); // ponemos el currentUser para que no haya que iniciar sesión
      //   iniciarSesion(userName, pass); // todo revisar
      // }
    return codigo;
  }

  // todo hacer método para cambiar user name y password

  /// Método que sirve para rellenar los formularios del usuario cuando ha iniciado sesión
  void rellenarFormularios(){
    // todo
  }

  /// Método para borrar un usuario existente de la lista
  /// todo cambiar con API
  void borrarUsuario(String user) {
    if (mapaUsuarios.containsKey(user)) {
      mapaUsuarios.remove(user);
    }
  }

  /// Método que sirve para desconectar al usuario actual de la sesión
  /// y volver a la pantalla de inicio de sesión
  void cerrarSesion() {
    setCurrentUser(null);
  }

  /// Método para poner el usuario que ha iniciado sesión
  /// Puede recibir valores nulos ya que se puede cerrar sesión y
  /// no habrá un usuario activo
  void setCurrentUser(Usuario? user) {
    currentUser = user;
  }
}

/// Clase que define toda la funcionalidad respecto a un usuario. Por ejemplo,
/// aquí se guardarán todos los formularios y categorías que éste cree, además
/// de servir como identificador a la hora de subir información a la BD
class Usuario {
  /// Atributos

  late int idUser; // este valor lo tiene que asignar la BD
  late String user; // Pensar si hay que comprobar en la base de datos que exista ese nombre
  late String pass;
  late GestorFormulario gestorFormulario;
  late Estadisticas estadisticas;

  Usuario(this.idUser, this.user, this.pass) {
    gestorFormulario = GestorFormulario();
    estadisticas = Estadisticas();
  } // Constructor 1

  void setIdUser(int id){
    idUser = id;
  }

  /// Método para mantener las estadísticas actualizadas.
  /// Se llama cada vez que se crea o modifica un formulario en
  /// [PantallaFormulario] método: generarBotonEnvio()
  void actualizarEstadisticas(){
    estadisticas.actualizarEstadisticas(gestorFormulario.listaFormularios);
  }
}
