import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:sem_sufoco/features/home/widgets/Graphic/app_graphic_setion.dart';
import 'package:sem_sufoco/features/home/widgets/app_bar_custom.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';
import 'package:sem_sufoco/features/categorie/widget/card_category_setion.dart';

// =========================
// Home Page
// =========================

class HomePage extends StatefulWidget {
  const HomePage({
    required this.pageController,
    required this.controller,
    super.key,
  });

  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userName = 'Usuário';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  // =========================
  // Carregar Nome do Usuário
  // =========================

  Future<void> _loadUserName() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) return;

    String? name;

    try {
      // Primeiro tenta buscar o nome na tabela profiles.
      final profile = await supabase
          .from('profiles')
          .select('full_name')
          .eq('id', user.id)
          .maybeSingle();

      name = profile?['full_name']?.toString();
    } catch (error) {
      debugPrint('Erro ao buscar perfil: $error');
    }

    // Se não encontrar na tabela, usa os metadados do cadastro.
    if (name == null || name.trim().isEmpty) {
      name = user.userMetadata?['full_name']?.toString();
    }

    if (!mounted) return;

    setState(() {
      _userName = (name != null && name.trim().isNotEmpty)
          ? name.trim()
          : 'Usuário';
    });
  }

  // =========================
  // Interface
  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBarCustom(userName: _userName),
      extendBodyBehindAppBar: false,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppGraphicSetion(),

                const Text('Categorias', style: AppTextStyle.subTitle),

                Consumer<CategoryController>(
                  builder: (context, categoryController, child) {
                    if (categoryController.isLoading &&
                        categoryController.categories.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (categoryController.errorMessage != null &&
                        categoryController.categories.isEmpty) {
                      return Text(
                        categoryController.errorMessage!,
                        style: const TextStyle(color: Colors.white),
                      );
                    }

                    return CardCategorySetion(
                      categories: categoryController.categories,
                      limit: 5,
                    );
                  },
                ),

                AppExtract(
                  pageController: widget.pageController,
                  controller: widget.controller,
                  limit: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
