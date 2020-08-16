// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atleta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtletaController on _AtletaControllerBase, Store {
  final _$atletaListAtom = Atom(name: '_AtletaControllerBase.atletaList');

  @override
  ObservableStream<List<AtletaModel>> get atletaList {
    _$atletaListAtom.reportRead();
    return super.atletaList;
  }

  @override
  set atletaList(ObservableStream<List<AtletaModel>> value) {
    _$atletaListAtom.reportWrite(value, super.atletaList, () {
      super.atletaList = value;
    });
  }

  final _$_AtletaControllerBaseActionController =
      ActionController(name: '_AtletaControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_AtletaControllerBaseActionController.startAction(
        name: '_AtletaControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_AtletaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(AtletaModel model) {
    final _$actionInfo = _$_AtletaControllerBaseActionController.startAction(
        name: '_AtletaControllerBase.save');
    try {
      return super.save(model);
    } finally {
      _$_AtletaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(AtletaModel model) {
    final _$actionInfo = _$_AtletaControllerBaseActionController.startAction(
        name: '_AtletaControllerBase.delete');
    try {
      return super.delete(model);
    } finally {
      _$_AtletaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
atletaList: ${atletaList}
    ''';
  }
}
