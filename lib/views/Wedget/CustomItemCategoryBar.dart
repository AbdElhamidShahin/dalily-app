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
    return GestureDetector(
      onTap: () {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    item['urlImage']!,
                  ),
                ),
              ),
            ),
            Text(
              item['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
