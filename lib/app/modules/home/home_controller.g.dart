// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$_editDeleteIsVisibleAtom =
      Atom(name: '_HomeBase._editDeleteIsVisible');

  @override
  bool get _editDeleteIsVisible {
    _$_editDeleteIsVisibleAtom.context
        .enforceReadPolicy(_$_editDeleteIsVisibleAtom);
    _$_editDeleteIsVisibleAtom.reportObserved();
    return super._editDeleteIsVisible;
  }

  @override
  set _editDeleteIsVisible(bool value) {
    _$_editDeleteIsVisibleAtom.context.conditionallyRunInAction(() {
      super._editDeleteIsVisible = value;
      _$_editDeleteIsVisibleAtom.reportChanged();
    }, _$_editDeleteIsVisibleAtom,
        name: '${_$_editDeleteIsVisibleAtom.name}_set');
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
  dynamic setEditDeleteIsVisible(bool value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setEditDeleteIsVisible(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
