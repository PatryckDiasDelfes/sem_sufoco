import 'package:flutter/material.dart';

import '../../core/model/category.dart';

final List<Category> mockCategories = [
  // =========================
  // Despesas
  // =========================
  Category(
    id: 'food',
    name: 'Alimentação',
    icon: Icons.restaurant_outlined,
    color: const Color(0xFFFFA726),
  ),

  Category(
    id: 'housing',
    name: 'Moradia',
    icon: Icons.home_outlined,
    color: const Color(0xFF42A5F5),
  ),

  Category(
    id: 'transport',
    name: 'Transporte',
    icon: Icons.directions_car_outlined,
    color: const Color(0xFFFFCA28),
  ),

  Category(
    id: 'health',
    name: 'Saúde',
    icon: Icons.health_and_safety_outlined,
    color: const Color(0xFFEF5350),
  ),

  Category(
    id: 'leisure',
    name: 'Lazer',
    icon: Icons.sports_esports_outlined,
    color: const Color(0xFFAB47BC),
  ),

  Category(
    id: 'shopping',
    name: 'Compras',
    icon: Icons.shopping_bag_outlined,
    color: const Color(0xFFEC407A),
  ),

  Category(
    id: 'education',
    name: 'Educação',
    icon: Icons.school_outlined,
    color: const Color(0xFF29B6F6),
  ),

  Category(
    id: 'other',
    name: 'Outros',
    icon: Icons.more_horiz_outlined,
    color: const Color(0xFF78909C),
  ),

  Category(
    id: 'pets',
    name: 'Pets',
    icon: Icons.pets_outlined,
    color: const Color(0xFF66BB6A),
  ),

  // =========================
  // Recebimentos
  // =========================
  Category(
    id: 'salary',
    name: 'Salário',
    icon: Icons.account_balance_wallet_outlined,
    color: const Color(0xFF26A69A),
  ),

  Category(
    id: 'freelance',
    name: 'Freela',
    icon: Icons.work_outline,
    color: const Color(0xFF7E57C2),
  ),
];
