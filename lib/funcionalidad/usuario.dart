import 'formulario.dart';

/// Clase para gestionar lo relacionado con los usuarios. Esta clase se
/// encarga de crear usuarios, almacenarlos, validarlos y poder acceder al
/// usuario que esté actualmente utilizando la aplicación
class GestorUsuario {
  Map<String, Usuario> mapaUsuarios = { // usamos un mapa para que sea más rápido
    "asdf": Usuario("asdf", "1234"),
  }; // siempre inicializamos con un usuario por defecto

  Usuario? currentUser; // el usuario que esté actualmente verificado. Puede ser null

  ///SINGLETON PARA NO CREAR MÁS DE 1 INSTANCIA DEL GESTOR
  GestorUsuario._privateConstructor();

  static final GestorUsuario _instance = GestorUsuario._privateConstructor();

  static GestorUsuario get instance => _instance;

  GestorUsuario() {
    currentUser = mapaUsuarios["admin"];
  }

  /// Método para que un usuario que tenga previamente creada una cuenta
  /// pueda iniciar sesión y pasar a ser el usuario actual
  /// Se comprueba si el usuario existe. Si existe, se comprueba que la
  /// contraseña introducida coincide con la almacenada
  int iniciarSesion(String user, String pass) {
    int codigo =
        0; // 0: usuario no existe / 1: inicio correcto / 2: credenciales inválidas / 3: campos vacíos

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
    return codigo;
  }

  /// Método que sirve para desconectar al usuario actual de la sesión
  /// y volver a la pantalla de inicio de sesión
  void cerrarSesion() {
    setCurrentUser(null);
  }

  /// Método que permite crear un nuevo usuario
  /// Primero comprueba si el nombre de usuario es válido y que no se ha
  /// introducido una contraseña vacía
  int registrarse(String user, String pass) {
    int codigo = 0; // 0: usuario ya existe / 1: correcto / 2: campo contraseña no válido / 3: user vacío

    if (!mapaUsuarios.containsKey(user) && user != '') {
      // el usuario NO existe -> true
      if (pass == '') {
        codigo = 2; // contraseña no válida
      } else {
        codigo = 1;
        mapaUsuarios[user] = Usuario(user, pass); // añadimos el nuevo usuario al mapa
        iniciarSesion(user, pass); // todo revisar iniciamos sesión directamente
      }
    } else {
      if (user == '') {
        codigo = 3; // el campo usuario está vacío
      } else {
        codigo = 0; // ya existe ese usuario
      }
    }
    return codigo;
  }

  // todo hacer método para cambiar user name y password

  /// Método para borrar un usuario existente de la lista
  void borrarUsuario(String user) {
    if (mapaUsuarios.containsKey(user)) {
      mapaUsuarios.remove(user);
    }
  }

  /// Método para poner el usuario que ha iniciado sesión
  /// Puede recibir valores nulos ya que se puede cerrar sesión y
  /// no habrá un usuario activo
  void setCurrentUser(Usuario? user) {
    currentUser = user;
  }

  /// Método debug para poder usar la aplicación antes de tener el sistema de
  /// login
  void setCurrentUserDefault() {
    setCurrentUser(mapaUsuarios["admin"]);
  }
}

/// Clase que define toda la funcionalidad respecto a un usuario. Por ejemplo,
/// aquí se guardarán todos los formularios y categorías que éste cree, además
/// de servir como identificador a la hora de subir información a la BD
class Usuario {
  /// Atributos
  late String
      user; // Pensar si hay que comprobar en la base de datos que exista ese nombre
  late String pass;
  late GestorFormulario gestorFormulario;

  Usuario(this.user, this.pass) {
    gestorFormulario = GestorFormulario();
  } // Constructor

//Método para que devuelva el gestor y/o métodos del gestor  --> editar o nuevo formulario

// todo pensar más posibles métodos: métodos para editar los campos --> hay que tocar la BD
}
