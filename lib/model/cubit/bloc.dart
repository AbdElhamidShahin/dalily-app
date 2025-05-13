import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_app/model/cubit/item.dart';

import '../../viwes/screens/Account_Screen.dart';
import '../../viwes/screens/Card_Screen.dart';
import '../../viwes/screens/CatogaryScreen.dart';
import '../../viwes/screens/Favorite_Screen.dart';
import '../../viwes/screens/Home_Layout.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super((TravelInitialState()));

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  int currentIndex = 2;

  List<Widget> screens = [
    AccountScreen(),
    CardScreen(),
    HomeLayout(),
    FavoriteScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(TravelBottomnavBarState());
  }

  final List<Map<String, dynamic>> items = [
    {
      'urlImage': 'assets/imageCatogry/dish-washing.png',
      'name': 'الوجبات',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'السندويتشات ',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/pizza.png',
      'name': 'البيتزا ',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/burger.png',
      'name': 'البرجر ',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/salad.png',
      'name': 'السلطات',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/panna-cotta.png',
      'name': 'الحلويات ',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/cold-drink.png',
      'name': 'مشروبات بارده',
      'table': 'test'
    },
    {
      'urlImage': 'assets/imageCatogry/hot-chocolate.png',
      'name': 'مشروبات ساخنه',
      'table': 'test'
    },
  ];
  Future<void> fetchCategoryData(String tableName, {String? uniqueId}) async {
    try {
      emit(CategoryLoadingState());

      final response = await Supabase.instance.client
          .from(tableName)
          .select(' name, price, image_url, time, number');

      if (response.isEmpty) {
        emit(CategoryErrorState('No data found for table "$tableName".'));
        return;
      }

      final List<Item> items = response
          .map((item) => Item(
        name: item['name'] ?? 'No Name',
        price: item['price']?.toString() ?? '0',
        imageUrl: item['image_url'] ?? '',
        time: item['time']?.toString() ?? 'Unknown',
        number: item['number']?.toString() ?? '0',
      ))
          .toList();

      emit(CategoryLoadedState(items, tableName, uniqueId: uniqueId ?? 'default'));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }


}
