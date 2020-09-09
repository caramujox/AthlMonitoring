// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipe_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EquipeController on _EquipeControllerBase, Store {
  final _$equipeListAtom = Atom(name: '_EquipeControllerBase.equipeList');

  @override
  ObservableStream<List<EquipeModel>> get equipeList {
    _$equipeListAtom.reportRead();
    return super.equipeList;
  }

  @override
  set equipeList(ObservableStream<List<EquipeModel>> value) {
    _$equipeListAtom.reportWrite(value, super.equipeList, () {
      super.equipeList = value;
    });
  }

  final _$_EquipeControllerBaseActionController =
      ActionController(name: '_EquipeControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(EquipeModel model) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.save');
    try {
      return super.save(model);
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(EquipeModel model) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.delete');
    try {
      return super.delete(model);
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
equipeList: ${equipeList}
    ''';
  }
}
