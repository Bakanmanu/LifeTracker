
CAMBIOS A REALIZAR:
    -Arreglar la pantalla de modificar formulario y los Static
    -Hacer que los botones se marquen (Opcional pero interesante)
    -Arreglar el formato de la hora
    -Mostrar los formularios en orden inverso y orden cronológico
    -Hacer que cuando editas un formulario te lleve al menu de mostrar formularios en vez de al menu principal
    -Mejorar un poco la interfaz grafica --> buscar paleta de colores

CAMBIOS REALIZADOS:
    -Al enviar un formulario, ahora muestra primero la alerta emergente y luego cambia de pantalla
        Anteriormente: primero cambiaba de pantalla y luego mostraba la alerta porque al cambiar de estado
            la alerta desaparecía si se ponía primero. Se ha solucionado con el uso de async y await


IDEAS DE PRUEBAS PARA REALIZAR
    -Comprobar que se guardan las respuestas de los formularios correctamente
    -Comprobar que el número de formularios guardados es correcto
    -Comprobar que el estado de ánimo se guarda correctamente
