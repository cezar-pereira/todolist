// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$_iconSelectedAtom = Atom(name: '_HomeBase._iconSelected');

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

  final _$_periodAtom = Atom(name: '_HomeBase._period');

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

  final _$_nameCategoryAtom = Atom(name: '_HomeBase._nameCategory');

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

  final _$categoriesAtom = Atom(name: '_HomeBase.categories');

  @override
  List<Category> get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic setPeriod(String value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setPeriod(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNameCategory(String value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setNameCategory(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIconSelected(int value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setIconSelected(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCategories() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getCategories();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'categories: ${categories.toString()}';
    return '{$string}';
  }
}
