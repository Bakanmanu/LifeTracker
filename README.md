
CAMBIOS A REALIZAR:
    -Arreglar la pantalla de modificar formulario para que actualice la preview del formulario
    -Hacer que los botones se marquen (Opcional pero interesante)
    -Arreglar el formato de la hora
    -Mostrar los formularios en orden inverso y orden cronológico
    -Mejorar un poco la interfaz grafica --> buscar paleta de colores
    -Añadir apartado para crear las acciones (MUY OPCIONAL)

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



PRÁCTICA 3 => LOS FICHEROS ESTÁN EN LA CARPETA test (uno para cada tipo de pruebas)

    PRUEBAS UNITARIAS: 2 métodos de 3 clases distintas
    -Comprobar que se guardan las respuestas de los formularios correctamente
    -Comprobar que el número de formularios guardados es correcto
    -Comprobar que el estado de ánimo se guarda correctamente

    PRUEBAS DE WIDGETS: Codificar y probar un grupo con 3 pruebas (test-widgets). De 2 páginas distintas

    PRUEBAS DE INTEGRACIÓN:
