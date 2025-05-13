import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/models/cubit/Bloc.dart';

import '../Screens/MedicalScreen.dart';

class CustomItemCategoryBar extends StatelessWidget {
  final Map<String, dynamic> item;

  const CustomItemCategoryBar({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(      onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => DalilyCubit()..fetchCategoryData(item['table']),
            child: MedicalScreen(
              tableName: item['table'],
            ), // Make sure to provide a child widget
            // اسم الجدول
          ),
        ),
      );
    },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // محاذاة العناصر في المنتصف
          mainAxisSize: MainAxisSize.min, // استخدام المساحة التي يحتاجها المحتوى فقط
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black12,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item['urlImage']!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain, // الحفاظ على الأبعاد داخل المساحة المحددة
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 90, // تحديد عرض الحاوية
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Text(
                    item['name']!,
                    style: const TextStyle(
                      fontSize: 16, // تحديد حجم النص
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
