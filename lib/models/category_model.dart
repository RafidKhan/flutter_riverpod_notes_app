import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final String? categoryName;
  final int? colorIndex;

  CategoryModel({
    this.categoryName = "",
    this.colorIndex = 0,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : categoryName = json['categoryName'] ?? "",
        colorIndex = json['colorIndex'] ?? 0;

  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
        'colorIndex': colorIndex,
      };

  CategoryModel copyWith({
    String? categoryName,
    int? colorIndex,
  }) {
    var categoryModel = CategoryModel(
        categoryName: categoryName ?? this.categoryName,
        colorIndex: colorIndex ?? this.colorIndex);
    return categoryModel;
  }
}
