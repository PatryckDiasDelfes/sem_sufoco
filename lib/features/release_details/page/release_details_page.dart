import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReleaseDetailsPage extends StatelessWidget {
  const ReleaseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Compra no débito',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        // actions: const [
        //   Icon(Icons.help_outline, color: Color(0xFF00BFA5)),
        //   SizedBox(width: 16),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            //Local do icon do café
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF0A2E22),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_cafe_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'R\$ 7,50',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Lucca Cantina E Restaublumenau Bra',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF0A2B20),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF124231)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant, color: Color(0xFF00BFA5), size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Alimentação',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.edit_outlined, color: Color(0xFF00BFA5), size: 18),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111E18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1B3026)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre a transação',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFF00BFA5),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Data da compra',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        'Terça-feira, 22/09/2026',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Color(0xFF00BFA5)),
                      SizedBox(width: 16),
                      Text(
                        'Horário',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        '09:57',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.storefront_outlined, color: Color(0xFF00BFA5)),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estabelecimento',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Lucca Cantina E Restaublumenau Bra',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Divider(color: Color(0xFF1B3026), height: 1),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: Color(0xFF00BFA5),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Adicionar descrição',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
