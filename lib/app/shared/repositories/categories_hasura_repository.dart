import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:todolist/app/modules/category/documents/repositories_document.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/repositories/categories_repository_interface.dart';

class CategoriesHasuraRepository
    with CategoriesRespositoryInterface, Disposable {
  final HasuraConnect _hasuraConnect;

  CategoriesHasuraRepository(this._hasuraConnect);

  @override
  void dispose() {}

  @override
  Stream<List<Category>> getCategories() {
    var snapshot = _hasuraConnect.subscription(getAllRepositoriesSubscription);
    return snapshot
        .map((data) => Category.fromJsonList(data["data"]["categorys"]));
  }

  @override
  Future<bool> addCategory(Category category) async {
    if (await checkCategoryExistence(nameCategory: category.name)) {
      return false;
    } else {
      var snapshot = await _hasuraConnect.mutation(addCategoryMutation,
          variables: {
            "name": category.name,
            "codePointIcon": category.codePointIcon
          });
      if (snapshot['data']['insert_categorys']['affected_rows'] == 1)
        return true;
      else
        return false;
    }
  }

  @override
  Future<bool> checkCategoryExistence({@required String nameCategory, String id}) async {
    var snapshot = await _hasuraConnect
        .query(checkForCategoryQuery, variables: {"name": nameCategory, "id": id});

    if ((snapshot['data']['categorys'] as List).length == 1)
      return true;
    else
      return false;
  }

  @override
  Future<bool> deleteCategory(Category category) async {
    var snapshot = await _hasuraConnect
        .mutation(deleteCategoryMutation, variables: {"id": category.id});
    if ((snapshot['data']['delete_categorys']['affected_rows'] == 1))
      return true;
    else
      return false;
  }

  @override
  Future<bool> updateCategory(Category category) async {
    if (await checkCategoryExistence(nameCategory: category.name, id: category.id)) {
      return false;
    } else {
      var snapshot =
          await _hasuraConnect.mutation(updateCategoryMutation, variables: {
        "id": category.id,
        "name": category.name,
        "codePointIcon": category.codePointIcon
      });
      if ((snapshot['data']['update_categorys']['affected_rows'] == 1))
        return true;
      else
        return false;
    }
  }
}
