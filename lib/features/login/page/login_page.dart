import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // 1. Injetamos o Provider no topo da hierarquia desta tela
    return ChangeNotifierProvider<LoginController>(
      create: (context) => LoginController(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          title: Text(
            'ENTRAR',
            style: AppTextStyle.headingLarge.copyWith(color: AppColors.white),
          ),
          //subtitle: const Text('Bem-vindo ao Sem Sufoco'),
        ),
        body: SafeArea(
          // 2. O Consumer agora encontra o Provider que criamos acima
          child: Consumer<LoginController>(
            builder: (context, controller, child) {
              return Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),

                      TextFormField(
                        cursorColor: AppColors.white,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.gray200,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: AppColors.colorsTheme,
                              width: 1,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        cursorColor: AppColors.white,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.gray200,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: AppColors.colorsTheme,
                              width: 1,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),

                      ElevatedButton(
                        onPressed: () {
                          context.push('/ReleaseDetailsPage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'ENTRAR',
                          style: AppTextStyle.headingSmall,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          context.push('/TransactionPage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Teste',
                          style: AppTextStyle.headingSmall,
                        ),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 1,
                            color: AppColors.colorsTheme,
                            width: 125,
                          ),
                          Container(
                            height: 1,
                            color: AppColors.colorsTheme,
                            width: 125,
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Column(
                        children: [
                          const Text(
                            'Logue com',
                            style: AppTextStyle.inputLabel,
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google.svg',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 30),
                              SvgPicture.asset(
                                'assets/icons/facebook.svg',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 30),
                              SvgPicture.asset(
                                'assets/icons/X.svg',
                                width: 30,
                                height: 30,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
