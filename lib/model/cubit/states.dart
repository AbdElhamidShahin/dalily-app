
import 'package:flutter/foundation.dart';
import 'package:food_app/model/cubit/item.dart';

abstract class FoodState {

}

class TravelInitialState extends FoodState {}

class TravelBottomnavBarState extends FoodState {}

class CategoryLoadingState extends FoodState {}


class CategoryLoadedState extends FoodState {
  final List<Item> items;
  final String tableName;
  final String uniqueId;

  CategoryLoadedState(this.items, this.tableName, {required this.uniqueId});
}

class CategoryErrorState extends FoodState {
  final String message;

  CategoryErrorState(this.message);
}