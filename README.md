
CAMBIOS A REALIZAR:
    -Hacer que los botones se marquen (Opcional pero interesante)
    -Añadir apartado para crear/importar categorías/acciones
    -Estudiar convergencia para unir las dos clases de editar y crear formulario -> STATE
        ->Patrón state que según donde se llame guarde un estado u otro (atributo de pantallaFormulario)
            y que en el botón tenga un if/else y llame a un método u otro
    -Estudiar y revisar que el que las categorías/acciones se creen en pantallaFormulario sea correcto o no y ver dónde se podria meter en un sitio más inicial (main o pantallaMenu)
    -Meter easter eggs

MEJORAS DE INTERFAZ GRÁFICA:
    -Hacer una paleta de color y aplicarla
    -Que cada formulario cambie según el ánimo correspondiente -> que la app entera vaya cambiando según la media
    -Hacer la paleta de color de la web respecto a la de la app -> hacerla 
    -Reestructurar el menú principal: tal vez:
            --Botón grande/vistoso de formulario nuevo
            --Configuración en appBar arriba y pequeñito
            --Ver formularios más en pequeñito pero visible


IDEAS APLICACIÓN WEB:
    -Hacer una página de estadísticas que te compara con la media
    -Hacer que los usuarios puedan subir/descargar sus packs de categorías

FUNCIONALIDAD DE LA API:
    -Inicio de sesión + tokens
    -Mandar datos de formularios -> control por fechas
    -


CAMBIOS REALIZADOS:
-Al enviar un formulario, ahora muestra primero la alerta emergente y luego cambia de pantalla
    ->Anteriormente: primero cambiaba de pantalla y luego mostraba la alerta porque al cambiar de estado
    la alerta desaparecía si se ponía primero. Se ha solucionado con el uso de async y await

-La pantallaEditarFormulario ahora funciona correctamente al solucionar el fallo que había al instancializar 
el gestor Singleton. Sólo falla que no se muestran en la previsualización los cambios realizados de 
Categorías/Acciones (el estado de ánimo y el texto, sí). Pero ahora sí muestra correctamente los valores 
guardados en el formulario y se actualizan si este es modificado
    ->Anteriormente: al entrar en la pantalla de mostrar formulario, se mostraban valores aleatorios constantes
    (debido a que se estaba usando static por un fallo de sintaxis → el fallo era que estábamos escribiendo el 
    código fuera del constructor, donde debería de ser). Sin embargo, internamente sí que se guardaban bien 
    los formularios.

-Se ha arreglado que se muestre las acciones de las categorías actualizadas en la preview.
    El problema era que no se estaban actualizando bien las acciones = true en la lista "respuestas"
    Anteriormente: Cuando modificabas un formulario y volvía a la pantalla de mostrar todos los formularios, 
    mostraba toda la información actualizada salvo las categorías, que se quedaban como se hubiera puesto
    originalmente

-Se ha limpiado el código en general y mejorado la eficiencia de los algoritmos

-Ahora la pantalla de mostrar formularios muestra los formularios en orden cronológico desdecente. Es decir,
muestra los más recientes primero.
    El problema era que, al crear un formulario, se llamaba al método List.add(...) que añade el elemento al final,
    por lo que se guardaban cronológicamente. Se ha resuelto usando el método List.insert(0, ...), que inserta
    el elemento en el índice 0 (es decir, añadimos el formulario al principio de la lista).

-Se ha arreglado el formato de la hora. Se ha dejado una clase formatoFecha que deja abierta una ventana a una
futura ampliación de mostrar fechas.
    Anteriormente se mostraba año, mes, día, hora, minuto, segundo y unos 8 dígitos de fracciones de segundo