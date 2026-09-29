import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';

class CategoryExtractPage extends StatelessWidget {
  const CategoryExtractPage({super.key});

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
          'CategoryExtractPage',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'CategoryExtractPage',
                style: AppTextStyle.headingLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            Container(),
            Column(children: [Text('data'), AppExtract()]),
          ],
        ),
      ),
    );
  }
}
