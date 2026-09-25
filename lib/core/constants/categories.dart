import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class Category {
  final String name;
  final IconData icon;
  const Category({required this.name, required this.icon});
}

class CategoriasIcons {
  static const IconData alimentacao = Symbols.restaurant; // chef_hat não existe, usei restaurant
  static const IconData lazer = Symbols.sports_esports;
  static const IconData transporte = Symbols.airplane_ticket; // <-- AQUI ESTAVA O ERRO
  static const IconData compras = Symbols.shopping_cart;
  static const IconData assinaturas = Symbols.subscriptions;
}

const List<Category> kCategories = [
  Category(name: 'Alimentação', icon: CategoriasIcons.alimentacao),
  Category(name: 'Transporte', icon: CategoriasIcons.transporte),
  Category(name: 'Assinaturas', icon: CategoriasIcons.assinaturas),
  Category(name: 'Compras', icon: CategoriasIcons.compras),
  Category(name: 'Lazer', icon: CategoriasIcons.lazer),
];