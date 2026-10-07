class Categories {
  static const String alimentacao = 'Alimentação';
  static const String lazer = 'Lazer';
  static const String transporte = 'Transporte';
  static const String compras = 'Compras';
  static const String assinaturas = 'Assinaturas';
}

class CategoriasIcons {
  static const String alimentacao = 'assets/icons/alimentacao.png';
  static const String lazer = 'assets/icons/lazer.png';
  static const String transporte = 'assets/icons/transporte.png';
  static const String compras = 'assets/icons/compras.png';
  static const String assinaturas = 'assets/icons/assinaturas.png';
}

List<String> getCategories() {
  return [
    Categories.alimentacao,
    Categories.lazer,
    Categories.transporte,
    Categories.compras,
    Categories.assinaturas,
  ];
}