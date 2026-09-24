import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class Category {
  final String name;
  final IconData icon;
  const Category({required this.name, required this.icon});
}

class CategoriasIcons {
  static const IconData alimentacao = Symbols.chef_hat;
  static const IconData lazer = Symbols.add;
  static const IconData transporte = Symbols.directions_car;
  static const IconData compras = Symbols.shopping_cart;
  static const IconData assinaturas = Symbols.subscriptions;
}

// Lista pronta pra usar na tela
const List<Category> kCategories = [
  Category(name: 'Alimentação', icon: CategoriasIcons.alimentacao),
  Category(name: 'Transporte', icon: CategoriasIcons.transporte),
  Category(name: 'Assinaturas', icon: CategoriasIcons.assinaturas),
  Category(name: 'Compras', icon: CategoriasIcons.compras),
  Category(name: 'Lazer', icon: CategoriasIcons.lazer),
];