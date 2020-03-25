// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskController on _TaskBase, Store {
  final _$_titleAtom = Atom(name: '_TaskBase._title');

  @override
  String get _title {
    _$_titleAtom.context.enforceReadPolicy(_$_titleAtom);
    _$_titleAtom.reportObserved();
    return super._title;
  }

  @override
  set _title(String value) {
    _$_titleAtom.context.conditionallyRunInAction(() {
      super._title = value;
      _$_titleAtom.reportChanged();
    }, _$_titleAtom, name: '${_$_titleAtom.name}_set');
  }

  final _$_hourAtom = Atom(name: '_TaskBase._hour');

  @override
  String get _hour {
    _$_hourAtom.context.enforceReadPolicy(_$_hourAtom);
    _$_hourAtom.reportObserved();
    return super._hour;
  }

  @override
  set _hour(String value) {
    _$_hourAtom.context.conditionallyRunInAction(() {
      super._hour = value;
      _$_hourAtom.reportChanged();
    }, _$_hourAtom, name: '${_$_hourAtom.name}_set');
  }

  final _$_minutesAtom = Atom(name: '_TaskBase._minutes');

  @override
  String get _minutes {
    _$_minutesAtom.context.enforceReadPolicy(_$_minutesAtom);
    _$_minutesAtom.reportObserved();
    return super._minutes;
  }

  @override
  set _minutes(String value) {
    _$_minutesAtom.context.conditionallyRunInAction(() {
      super._minutes = value;
      _$_minutesAtom.reportChanged();
    }, _$_minutesAtom, name: '${_$_minutesAtom.name}_set');
  }

  final _$_dayAtom = Atom(name: '_TaskBase._day');

  @override
  String get _day {
    _$_dayAtom.context.enforceReadPolicy(_$_dayAtom);
    _$_dayAtom.reportObserved();
    return super._day;
  }

  @override
  set _day(String value) {
    _$_dayAtom.context.conditionallyRunInAction(() {
      super._day = value;
      _$_dayAtom.reportChanged();
    }, _$_dayAtom, name: '${_$_dayAtom.name}_set');
  }

  final _$_monthAtom = Atom(name: '_TaskBase._month');

  @override
  String get _month {
    _$_monthAtom.context.enforceReadPolicy(_$_monthAtom);
    _$_monthAtom.reportObserved();
    return super._month;
  }

  @override
  set _month(String value) {
    _$_monthAtom.context.conditionallyRunInAction(() {
      super._month = value;
      _$_monthAtom.reportChanged();
    }, _$_monthAtom, name: '${_$_monthAtom.name}_set');
  }

  final _$_categoryAtom = Atom(name: '_TaskBase._category');

  @override
  String get _category {
    _$_categoryAtom.context.enforceReadPolicy(_$_categoryAtom);
    _$_categoryAtom.reportObserved();
    return super._category;
  }

  @override
  set _category(String value) {
    _$_categoryAtom.context.conditionallyRunInAction(() {
      super._category = value;
      _$_categoryAtom.reportChanged();
    }, _$_categoryAtom, name: '${_$_categoryAtom.name}_set');
  }

  final _$_categoryIdAtom = Atom(name: '_TaskBase._categoryId');

  @override
  String get _categoryId {
    _$_categoryIdAtom.context.enforceReadPolicy(_$_categoryIdAtom);
    _$_categoryIdAtom.reportObserved();
    return super._categoryId;
  }

  @override
  set _categoryId(String value) {
    _$_categoryIdAtom.context.conditionallyRunInAction(() {
      super._categoryId = value;
      _$_categoryIdAtom.reportChanged();
    }, _$_categoryIdAtom, name: '${_$_categoryIdAtom.name}_set');
  }

  final _$_importanceSelectedAtom = Atom(name: '_TaskBase._importanceSelected');

  @override
  int get _importanceSelected {
    _$_importanceSelectedAtom.context
        .enforceReadPolicy(_$_importanceSelectedAtom);
    _$_importanceSelectedAtom.reportObserved();
    return super._importanceSelected;
  }

  @override
  set _importanceSelected(int value) {
    _$_importanceSelectedAtom.context.conditionallyRunInAction(() {
      super._importanceSelected = value;
      _$_importanceSelectedAtom.reportChanged();
    }, _$_importanceSelectedAtom,
        name: '${_$_importanceSelectedAtom.name}_set');
  }

  final _$_descriptionAtom = Atom(name: '_TaskBase._description');

  @override
  String get _description {
    _$_descriptionAtom.context.enforceReadPolicy(_$_descriptionAtom);
    _$_descriptionAtom.reportObserved();
    return super._description;
  }

  @override
  set _description(String value) {
    _$_descriptionAtom.context.conditionallyRunInAction(() {
      super._description = value;
      _$_descriptionAtom.reportChanged();
    }, _$_descriptionAtom, name: '${_$_descriptionAtom.name}_set');
  }

  final _$_messageErrorAtom = Atom(name: '_TaskBase._messageError');

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

  final _$_TaskBaseActionController = ActionController(name: '_TaskBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setTitle(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHour(int value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setHour(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinutes(int value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setMinutes(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDay(int value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setDay(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMonth(int value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setMonth(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategory(String value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setCategory(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImportance(int value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setImportance(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setDescription(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMessageError(String value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.setMessageError(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fillTask(Task task) {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.fillTask(task);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanPage() {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.cleanPage();
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_TaskBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
