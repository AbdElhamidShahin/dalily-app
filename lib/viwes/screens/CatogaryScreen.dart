import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/bloc.dart';
import 'package:food_app/model/cubit/states.dart';


class CatogaryScreen extends StatelessWidget {
  final String tableName;
  const CatogaryScreen({Key? key, required this.tableName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الـ Cubit انشأناه في ال-Navigator
    return Scaffold(
      appBar: AppBar(title: Text('تصنيف $tableName')),
      body: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoadedState) {
            final items = state.items; // assuming لديك هذا الحقل في الـ state
            if (items.isEmpty) {
              return Center(child: Text('لا يوجد عناصر'));
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) {
                final it = items[i];
                return ListTile(
                  leading: it.imageUrl.startsWith('http')
                      ? Image.network(it.imageUrl,
                          width: 50, height: 50, fit: BoxFit.cover)
                      : Image.asset(it.imageUrl,
                          width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(it.name),
                  subtitle: Text('${it.price} ر.س'),
                  trailing: Text(it.name),
                );
              },
            );
          } else if (state is CategoryErrorState) {
            return Center(child: Text('خطأ: ${state.message}'));
          }
          return Center(child: Text('اضغط على أيقونة لعرض التفاصيل'));
        },
      ),
    );
  }
}
