// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$periodAtom = Atom(name: '_HomeBase.period');

  @override
  String get period {
    _$periodAtom.context.enforceReadPolicy(_$periodAtom);
    _$periodAtom.reportObserved();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.context.conditionallyRunInAction(() {
      super.period = value;
      _$periodAtom.reportChanged();
    }, _$periodAtom, name: '${_$periodAtom.name}_set');
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
  dynamic setPeriod(String period) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setPeriod(period);
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
  String toString() {
    final string =
        'period: ${period.toString()},categories: ${categories.toString()}';
    return '{$string}';
  }
}
