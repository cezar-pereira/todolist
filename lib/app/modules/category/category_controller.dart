import 'package:mobx/mobx.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/repositories/categories_hasura_repository.dart';

part 'category_controller.g.dart';

class CategoryController = _CategoryBase with _$CategoryController;

abstract class _CategoryBase with Store {
  CategoriesHasuraRepository categoriesHasuraRepository;

  _CategoryBase(this.categoriesHasuraRepository){
    getCategories();
  }

  String _categoryId;
  
  @observable
  String _nameCategory = "";
  @observable
  int _iconSelected = 59389;
  @observable
  String _period = "Hoje";
  @observable
  String _messageError = "";
  @observable
  ObservableStream<List<Category>> categories;

  @action
  setNameCategory(String value) {
    value = value.toLowerCase();
    value = value.replaceFirst(value[0], value[0].toUpperCase());
    this._nameCategory = value;
  }

  String get getNameCategory => this._nameCategory;

  @action
  setIconSelected(int value) => this._iconSelected = value;
  int get getIconSelected => this._iconSelected;

  @action
  setMessageError(String value) => this._messageError = value;
  String get getMessageError => this._messageError;

  @action
  getCategories() async {
    categories = categoriesHasuraRepository.getCategories().asObservable();
  }

  @action
  fillValues({Category category}) {
    if (category == null) {
      this._nameCategory = "";
      this._iconSelected = 59389;
    } else {
      print("id: ${category.id}");
      print("nome: ${category.name}");
      print("code: ${category.codePointIcon}");
      this._categoryId = category.id;
      this._nameCategory = category.name;
      this._iconSelected = category.codePointIcon;
    }
    this._messageError = "";
  }

  @action
  Future<bool> addCategory() async {
    Category category = Category(name: getNameCategory, codePointIcon: getIconSelected);
    return categoriesHasuraRepository.addCategory(category);
  }

  @action
  Future<bool> updateCategory() async {
    Category category = Category(
        id: this._categoryId,
        name: this._nameCategory,
        codePointIcon: this._iconSelected);
    return await this.categoriesHasuraRepository.updateCategory(category);
  }
  
  @action
  Future<bool> deleteCategory(Category category) async {
    return await this.categoriesHasuraRepository.deleteCategory(category);
  }

}
