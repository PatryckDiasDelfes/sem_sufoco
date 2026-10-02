import 'package:flutter/material.dart';

import '../../core/model/category.dart';

final List<Category> mockCategories = [
  Category(id: 'food', name: 'Alimentação', icon: Icons.restaurant_outlined),
  Category(id: 'housing', name: 'Moradia', icon: Icons.home_outlined),
  Category(
    id: 'transport',
    name: 'Transporte',
    icon: Icons.directions_car_outlined,
  ),
  Category(id: 'health', name: 'Saúde', icon: Icons.health_and_safety_outlined),
  Category(id: 'leisure', name: 'Lazer', icon: Icons.sports_esports_outlined),
  Category(id: 'shopping', name: 'Compras', icon: Icons.shopping_bag_outlined),
  Category(id: 'education', name: 'Educação', icon: Icons.school_outlined),
  Category(id: 'other', name: 'Outros', icon: Icons.more_horiz_outlined),
  Category(id: 'pets', name: 'Pets', icon: Icons.pets_outlined),
];
