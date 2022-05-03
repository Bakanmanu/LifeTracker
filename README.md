# CAMBIOS A REALIZAR (por orden de importancia):

- ***IMPORTANTE:*** Plantearse si sería buena idea refactorizar la clase *GestorFormulario* y repartirla
con una nueva clase "Usuario" o similar que contenga toda la información de una persona, como, 
por ejemplo, la lista de formularios, las categorías que ha creado...

- Añadir apartado para crear/importar/modificar/borrar/subir categorías/acciones --> *investigar que se puedan quitar modularmente*
  > Por ejemplo: hacer método que quite y ponga categoría según nombre/id y que se acceda cuando se pulsa un botón
  de un menú que tendrá que mostrar previamente todas las categorias disponibles (se pueden activar y desactivar)

- Cambiar las categorías por iconos que cambien de color (el fondo por ejemplo) al ser marcados
en lugar de que sea un checklist simple (seguro que hay alguna forma de personalizar los sprites
del CheckBox o del ListView)
  
- Hacer una clase _(para las estadísticas)_ que se comunique con el gestor de formularios que sea la que permita subir la 
  información de los formularios a la API (controlando que no se suba información repetida). 
  > Esta clase, muy probablemente, también puede que tenga que ser Singleton (pensar alguna alternativa)
  
- Hacer apartado para crear categorías desde la app
    > Clase gestor_categorías, que tiene que ser Singleton y hay que pensarse bien los métodos y atributos que ponerle

- Estudiar y revisar que el que las categorías/acciones se creen en pantallaFormulario sea correcto o no y ver dónde se podria meter en un sitio más inicial (main o pantallaMenu)

- Meter easter eggs

- Intentar que, al MostrarFormularios se clasifiquen según el día. Es decir, que todos los
formularios del mismo día se muestren en el mismo apartado y se diferencien de los de otros días

-----------------------------------------------

# MEJORAS DE INTERFAZ GRÁFICA:
- Hacer una paleta de color y aplicarla
- Que cada formulario cambie según el ánimo correspondiente -> que la app entera vaya cambiando según la media
- Hacer la paleta de color de la web respecto a la de la app -> hacerla 
- Reestructurar el menú principal: tal vez:
        --Botón grande/vistoso de formulario nuevo
        --Configuración en appBar arriba y pequeñito
        --Ver formularios más en pequeñito pero visible
- Poner colores análogos para la interfaz porque genera tranquilidad en vez de contraste
- Posibles colores:
    -Cyan / Colores pastel / Relojes decathlon https://twitter.com/tobarrax2/status/1519200070742294529

-----------------------------------------------

# IDEAS APLICACIÓN WEB:
- Hacer una página de estadísticas que te compara con la media
- Hacer que los usuarios puedan subir/descargar sus packs de categorías

-----------------------------------------------

# FUNCIONALIDAD DE LA API:
- Inicio de sesión + tokens
- Mandar datos de formularios -> control por fechas para no duplicar formularios
-

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

-----------------------------------------------

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

