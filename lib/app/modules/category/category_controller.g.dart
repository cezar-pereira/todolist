// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryBase, Store {
  final _$_nameCategoryAtom = Atom(name: '_CategoryBase._nameCategory');

  @override
  String get _nameCategory {
    _$_nameCategoryAtom.context.enforceReadPolicy(_$_nameCategoryAtom);
    _$_nameCategoryAtom.reportObserved();
    return super._nameCategory;
  }

  @override
  set _nameCategory(String value) {
    _$_nameCategoryAtom.context.conditionallyRunInAction(() {
      super._nameCategory = value;
      _$_nameCategoryAtom.reportChanged();
    }, _$_nameCategoryAtom, name: '${_$_nameCategoryAtom.name}_set');
  }

  final _$_iconSelectedAtom = Atom(name: '_CategoryBase._iconSelected');

  @override
  int get _iconSelected {
    _$_iconSelectedAtom.context.enforceReadPolicy(_$_iconSelectedAtom);
    _$_iconSelectedAtom.reportObserved();
    return super._iconSelected;
  }

  @override
  set _iconSelected(int value) {
    _$_iconSelectedAtom.context.conditionallyRunInAction(() {
      super._iconSelected = value;
      _$_iconSelectedAtom.reportChanged();
    }, _$_iconSelectedAtom, name: '${_$_iconSelectedAtom.name}_set');
  }

  final _$_periodAtom = Atom(name: '_CategoryBase._period');

  @override
  String get _period {
    _$_periodAtom.context.enforceReadPolicy(_$_periodAtom);
    _$_periodAtom.reportObserved();
    return super._period;
  }

  @override
  set _period(String value) {
    _$_periodAtom.context.conditionallyRunInAction(() {
      super._period = value;
      _$_periodAtom.reportChanged();
    }, _$_periodAtom, name: '${_$_periodAtom.name}_set');
  }

  final _$_messageErrorAtom = Atom(name: '_CategoryBase._messageError');

  @override
  String get _messageError {
    _$_messageErrorAtom.context.enforceReadPolicy(_$_messageErrorAtom);
    _$_messageErrorAtom.reportObserved();
    return super._messageError;
  }

  @override
  set _messageError(String value) {
    _$_messageErrorAtom.context.conditionallyRunInAction(() {
      super._messageError = value;
      _$_messageErrorAtom.reportChanged();
    }, _$_messageErrorAtom, name: '${_$_messageErrorAtom.name}_set');
  }

  final _$categoriesAtom = Atom(name: '_CategoryBase.categories');

  @override
  ObservableStream<List<Category>> get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(ObservableStream<List<Category>> value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$getCategoriesAsyncAction = AsyncAction('getCategories');

  @override
  Future getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$addCategoryAsyncAction = AsyncAction('addCategory');

  @override
  Future<bool> addCategory() {
    return _$addCategoryAsyncAction.run(() => super.addCategory());
  }

  final _$updateCategoryAsyncAction = AsyncAction('updateCategory');

  @override
  Future<bool> updateCategory() {
    return _$updateCategoryAsyncAction.run(() => super.updateCategory());
  }

  final _$deleteCategoryAsyncAction = AsyncAction('deleteCategory');

  @override
  Future<bool> deleteCategory(Category category) {
    return _$deleteCategoryAsyncAction
        .run(() => super.deleteCategory(category));
  }

  final _$_CategoryBaseActionController =
      ActionController(name: '_CategoryBase');

  @override
  dynamic setNameCategory(String value) {
    final _$actionInfo = _$_CategoryBaseActionController.startAction();
    try {
      return super.setNameCategory(value);
    } finally {
      _$_CategoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIconSelected(int value) {
    final _$actionInfo = _$_CategoryBaseActionController.startAction();
    try {
      return super.setIconSelected(value);
    } finally {
      _$_CategoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessageError(String value) {
    final _$actionInfo = _$_CategoryBaseActionController.startAction();
    try {
      return super.setMessageError(value);
    } finally {
      _$_CategoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fillValues({Category category}) {
    final _$actionInfo = _$_CategoryBaseActionController.startAction();
    try {
      return super.fillValues(category: category);
    } finally {
      _$_CategoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'categories: ${categories.toString()}';
    return '{$string}';
  }
}
