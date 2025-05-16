import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Category {
  final String name;
  final String description;
  final String imageUrl;
  final int? number;

  Category({
    this.number,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'number': number,

    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      number: json['number'],
    );
  }
}
