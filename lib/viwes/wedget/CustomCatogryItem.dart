import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/cubit/bloc.dart';
import '../../view_model/commpnas/color.dart';
import '../screens/CatogaryScreen.dart';

class Customcatogryitem extends StatelessWidget {
  final Map<String, dynamic> item;
  Customcatogryitem({
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
              create: (_) => FoodCubit()..fetchCategoryData(item['table']),
              child: CatogaryScreen(
                tableName: item['table'],
              ), // Make sure to provide a child widget
              // اسم الجدول
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorBasic,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image(
                  image: AssetImage(item['urlImage']),
                ),
              ),
            ),
            Text(
              item['name']!,
              style: TextStyle(
                  color: colorA, fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
