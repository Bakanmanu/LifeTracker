# CAMBIOS A REALIZAR (por orden de importancia):

- Crear método para editar username y password (OPC)

- Ver cómo se podría hacer para que fueran iconos clicables
en vez de ListView: Cambiar las categorías por iconos que cambien de color (el fondo por ejemplo) 
al ser marcados en lugar de que sea un checklist simple (seguro que hay alguna forma de personalizar los sprites
del CheckBox o del ListView)

- Añadir apartado para crear/importar/modificar/borrar/subir categorías/acciones --> *investigar que se puedan quitar modularmente*
    > Por ejemplo: hacer método que quite y ponga categoría según nombre/id y que se acceda cuando se pulsa un botón
    de un menú que tendrá que mostrar previamente todas las categorias disponibles (se pueden activar y desactivar)

- Meter easter eggs

- Intentar que, al MostrarFormularios se clasifiquen según el día. Es decir, que todos los
formularios del mismo día se muestren en el mismo apartado y se diferencien de los de otros días
  
### Bugs:

-----------------------------------------------

# CAMBIOS REALIZADOS:
## Entre la Práctica 2 y la Práctica 3
- Al enviar un formulario, ahora muestra primero la alerta emergente y luego cambia de pantalla
    > Anteriormente: primero cambiaba de pantalla y luego mostraba la alerta porque al cambiar de estado
    la alerta desaparecía si se ponía primero. Se ha solucionado con el uso de async y await

- La pantallaEditarFormulario ahora funciona correctamente al solucionar el fallo que había al instancializar 
el gestor Singleton. Sólo falla que no se muestran en la previsualización los cambios realizados de 
Categorías/Acciones (el estado de ánimo y el texto, sí). Pero ahora sí muestra correctamente los valores 
guardados en el formulario y se actualizan si este es modificado
    > Anteriormente: al entrar en la pantalla de mostrar formulario, se mostraban valores aleatorios constantes
    (debido a que se estaba usando static por un fallo de sintaxis → el fallo era que estábamos escribiendo el 
    código fuera del constructor, donde debería de ser). Sin embargo, internamente sí que se guardaban bien 
    los formularios.

- Se ha arreglado que se muestre las acciones de las categorías actualizadas en la preview. 
  El problema era que no se estaban actualizando bien las acciones = true en la lista "respuestas"
    > Anteriormente: Cuando modificabas un formulario y volvía a la pantalla de mostrar todos los formularios, 
    mostraba toda la información actualizada salvo las categorías, que se quedaban como se hubiera puesto
    originalmente

- Se ha limpiado el código en general y mejorado la eficiencia de los algoritmos

- Ahora la pantalla de mostrar formularios muestra los formularios en orden cronológico desdecente. Es decir,
muestra los más recientes primero.
    > El problema era que, al crear un formulario, se llamaba al método List.add(...) que añade el elemento al final,
    por lo que se guardaban cronológicamente. Se ha resuelto usando el método List.insert(0, ...), que inserta
    el elemento en el índice 0 (es decir, añadimos el formulario al principio de la lista).

- Se ha arreglado el formato de la hora. Se ha dejado una clase formatoFecha que deja abierta una ventana a una
futura ampliación de mostrar fechas.
    > Anteriormente se mostraba año, mes, día, hora, minuto, segundo y unos 8 dígitos de fracciones de segundo


## Entre la Práctica 3 y la Práctica 4

- Se ha modificado el método que devuelve las categorías. Ahora es una mezcla entre las que vienen default
y las que se puedne descargar (falta implementación con servidor web). 
  Aún falta, de todas formas, intentarhablitar la opción de que se puedan quitar y poner de forma modular

- Se ha creado una carpeta 'deprecated' para métodos que se han creado pero se ha replanteado su utilidad
y encontrado ésta como nula, pero se guardan por posible interés futuro

- Se ha creado un atributo en _GestorFormulario_ que indica si la _pantallaFormulario_ actúa para *crear*
un formulario nuevo o para *modificarlo*. Se habia planteado utilizar Strategy, pero se canceló por los
motivos expuestos a continuación:
    > "Se ha intentado aplicar el patrón Strategy a la pantalla que muestra los formularios. Para esto, se ha 
    borrado la clase pantallaEditarFormulario porque generaba un antipatrón muy grande que duplicaba código.
    Se había intentado hacer que, cada vez que se llevara a la pantalla de formulario, se indicara por
    parámetro en la instanciación la Estrategia a usar, pero esto daba problemas de valores nulos que no 
    supe resolver. La idea que se me ocurrió fue poner un booleano en GestorFormularios que tuviera
    guardado el estado deseado y, cada vez que se vaya a la pantalla de formularios, se guarda en el
    atributo PantallaFormulario._strat la estrategia en cuestión.
    Mencionar que hay que tener especial cuidado con sobrecargar las responsabilidades de GestorFormulario
    ya que, al ser un Singleton, corre mucho riesgo de ser un Antipatrón Blob. Es por esto por lo que
    al final he decidido simplemente sacrificar que GestorFormulario tenga una responsabilidad más 
    (ya tiene demasiadas) a cambio de un menor acoplamiento, ya que habría que importar el Gestor
    en el Strategy para recoger los datos de los formularios a la hora de mostrarlos"

- Ahora los botones de estado de ánimo son botones de verdad que reaccionan al tacto y se mantiene
el color del estado actual. Si se cambia, se desactiva el anterior activo
    > Anteriormente: Eran imágenes en un GridView sensibles al tacto que no mostraban respuesta al usuario

## En Práctica 4

- Se han creado las clases Usuario y GestorUsuario. GestorUsuario funciona de forma similar que
anteriormente el GestorFormulario. La diferencia es que ahora GestorFormulario es una clase no Singleton
que existe en cada unidad de usuario. GestorUsuario sí que es un Singleton que contiene una estructura
(Mapa) con todos los usuarios creados y tiene sistema de validación. Esto habrá que modificarlo una vez
se interactúe con la API, ya que esta estructura de usuarios deberá validarse en la base de datos,
además de almacenarse allí. Sólo faltaría unir con la pantalla de login para que utilice los métodos
de esta nueva clase creada (GestorUsuario) y poder tener ya muchos usuarios.
De momento, se inicia sesión automáticamente con un usuario doomie

- Se ha creado la pantalla de registro, vinculada al inicio de sesión

- Se han creado alertas relacionadas con problemas al registrarse / iniciar sesión. Se propone
la siguiente simbología de códigos que devuelven las funciones de registro y login:
  - 0: Login: el usuario no existe / Registro: el usuario ya existe
  - 1: Login / registro correcto
  - 2: Contraseña incorrecta / no válida
  - 3: Campos vacíos

- Arreglado (creo) el overflow y se ha hecho que, cuando se cierra sesión, no se permita hacer
pop y volver a donde antes, sino que se borra toda la pila. Además, cuando se inicia sesión no permite
volver atrás a no ser que se cierre sesión. Esto para evitar incordios.

- Cambiada la interfaz del menú: 
  - Se ha quitado el apartado de gestionar categorías y el apartado de editar perfil se encuentra en la appbar
  - El botón de guardar formulario ahora está en la esquina superior derecha
  - Ahora la preview de los formularios cambia de color según el estado de ánimo
  - Ahora, las categorías que no tienen acciones activas, no se muestran en la preview
  - Ahora, las categorías se separan con un borde del color del estado de animo
  - La fuente de los formularios cambia de color según el estado de ánimo
  - Los botones de modificar formulario cambia según el estado de ánimo
  - Ahora el menú principal tiene una BottomNavigationBar más elegante para moverse por la interfaz

- Se han añadido y modificado muchisimas categorías base

- Ahora el campo contraseña puede ponerse visible u oculto

- Se ha creado la clase de categorías y su correspondiente implementación en la pantalla de perfil

- Se ha creado la clase de estadísticas, que recopila los datos y los resume para el usuario

