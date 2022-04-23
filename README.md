
CAMBIOS A REALIZAR:
    -Hacer que los botones se marquen (Opcional pero interesante)
    -Arreglar el formato de la hora
    -Mostrar los formularios en orden inverso y orden cronológico
    -Mejorar un poco la interfaz grafica --> buscar paleta de colores
    -Añadir apartado para crear las acciones (MUY OPCIONAL)
    -Estudiar convergencia para unir las dos clases de editar y crear formulario -> tal vez con un if o buscar algún patrón
    -Estudiar y revisar que el que las categorías/acciones se creen en pantallaFormulario sea correcto o no y ver dónde se podria meter en un sitio más inicial (main o pantallaMenu)

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



PRÁCTICA 3 => LOS FICHEROS ESTÁN EN LA CARPETA test (uno para cada tipo de pruebas)

    PRUEBAS UNITARIAS: 2 métodos de 3 clases distintas
    -Comprobar que se guardan las respuestas de los formularios correctamente
    -Comprobar que el número de formularios guardados es correcto
    -Comprobar que el estado de ánimo se guarda correctamente

    CLASE:
        GestorFormulario:
            crearFormulario() -> comprobar que los campos se han guardado bien y que la lista de formularios tiene el numero de formularios
            borrarFormulario()-> comprobar que la lista de formularios reduce su .length en 1
            getFormEditar()   -> ver que se recibe correctamente el formulario que se pide

        Categoria:
            anadirRespuesta()       -> ver que la respuesta se añade
            actualizarRespuesta()   -> ver que las respuestas se actualizan

        Accion:
            cambiarActivo()     -> comprobar que se cambia correctamente cada vez que se llama
            crearAccion()       -> ver que se crea

    PRUEBAS DE WIDGETS: Codificar y probar un grupo con 3 pruebas (test-widgets). De 2 páginas distintas

    PRUEBAS DE INTEGRACIÓN: ver que el metodo crear formulario llama y usa bien el de crear categorias default
