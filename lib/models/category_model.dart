import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final Color color;
  final String categoryName;

  CategoryModel({this.color = Colors.white, this.categoryName = "default"});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : categoryName = json['categoryName'],
        color = json['color'];

  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
        'color': color,
      };

  CategoryModel copyWith({
    Color? color,
  }) {
    var categoryModel = CategoryModel(
      color: color ?? this.color,
      categoryName: categoryName ?? this.categoryName,
    );
    return categoryModel;
  }
}
