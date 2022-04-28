class ElementoEstadoAnimo{
  int id;
  String nombre;
  String imagen;

  ElementoEstadoAnimo(this.id, this.nombre, this.imagen);

}
final estadosAnimo = [
  ElementoEstadoAnimo(1, "Enfadado", "enfadado.png"),
  ElementoEstadoAnimo(2, "Triste", "triste.png"),
  ElementoEstadoAnimo(3, "Neutro", "neutral.png"),
  ElementoEstadoAnimo(4, "Contento", "contento.png"),
  ElementoEstadoAnimo(5, "Feliz", "feliz.png")
];