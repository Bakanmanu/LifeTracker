import 'accion.dart';
import 'categoria.dart';

final formularioDefault = [
  Categoria(enunciado: '¿Cuánto has dormido?', acciones: [
    Accion(0, "0 horas", false),
    Accion(2, "1-3 horas", false),
    Accion(5, "4-6 horas", false),
    Accion(8, "7-8 horas", false),
    Accion(10, "+8 horas", false),
  ]),
  Categoria(enunciado: 'Calidad del sueño', acciones: [
    Accion(1, "Insomnio", false),
    Accion(2, "Mala", false),
    Accion(3, "Neutral", false),
    Accion(4, "Buena", false),
    Accion(0, "Dormir acompañado", false),
  ]),
  Categoria(enunciado: 'Autoestima', acciones: [
    Accion(1, "Muy baja", false),
    Accion(2, "Baja", false),
    Accion(3, "Neutral", false),
    Accion(4, "Alta", false),
    Accion(5, "Muy alta", false),
  ]),
  Categoria(enunciado: 'Productividad', acciones: [
    Accion(1, "Muy baja", false),
    Accion(2, "Baja", false),
    Accion(3, "Neutral", false),
    Accion(4, "Alta", false),
    Accion(5, "Muy alta", false),
  ]),
  Categoria(enunciado: '¿Cuánto deporte has hecho?', acciones: [
    Accion(0, "0h", false),
    Accion(1, "0.5h", false),
    Accion(2, "1h", false),
    Accion(3, "1.5h", false),
    Accion(4, "2h", false),
    Accion(5, "+2h", false),
  ],),
  Categoria(enunciado: 'Quehaceres', acciones: [
    Accion(0, "Hacer la compra", false),
    Accion(1, "Hacer la colada", false),
    Accion(2, "Hacer la comida", false),
    Accion(3, "Limpiar el cuarto", false),
    Accion(4, "Barrer la casa", false),
    Accion(5, "Lavar los platos", false),
    Accion(6, "Lavar el coche", false),
  ]),
  Categoria(enunciado: '¿Qué has comido?', acciones: [
    Accion(0, "Fruta", false),
    Accion(1, "Verdura", false),
    Accion(2, "Carne", false),
    Accion(3, "Pescado", false),
    Accion(4, "Lácteos", false),
    Accion(5, "Pasta", false),
    Accion(6, "Arroz", false)
  ]),
  Categoria(enunciado: 'Entretenimiento', acciones: [
    Accion(0, "Echar la siesta", false),
    Accion(1, "Comer con amigos", false),
    Accion(2, "Salir de fiesta", false),
    Accion(3, "Ver una peli/serie", false),
    Accion(4, "Jugar videojuegos", false),
    Accion(5, "Tocar un instrumento", false),
    Accion(6, "Ir de viaje", false)
  ]),
  Categoria(enunciado: '¿Qué tiempo hace?', acciones: [
    Accion(0, "Soleado", false),
    Accion(1, "Nublado", false),
    Accion(2, "Lluvia", false),
    Accion(3, "Nieve", false),
    Accion(4, "Granizo", false),
    Accion(5, "Tormenta", false),
    Accion(6, "Calima", false),
    Accion(7, "Frío", false),
    Accion(8, "Calor", false),
  ],),
];