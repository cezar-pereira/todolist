import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/app/shared/models/category.dart';

abstract class CategoriesRespositoryInterface{
  Stream<List<Category>> getCategories();

  Future<bool> addCategory(Category category);
  Future<bool> deleteCategory(Category category);
  Future<bool> updateCategory(Category category);

  Future<bool> checkCategoryExistence({@required String nameCategory});


  
}