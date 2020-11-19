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

  final _$equipesDoTreinadorListAtom =
      Atom(name: '_EquipeControllerBase.equipesDoTreinadorList');

  @override
  ObservableStream<List<EquipeModel>> get equipesDoTreinadorList {
    _$equipesDoTreinadorListAtom.reportRead();
    return super.equipesDoTreinadorList;
  }

  @override
  set equipesDoTreinadorList(ObservableStream<List<EquipeModel>> value) {
    _$equipesDoTreinadorListAtom
        .reportWrite(value, super.equipesDoTreinadorList, () {
      super.equipesDoTreinadorList = value;
    });
  }

  final _$_EquipeControllerBaseActionController =
      ActionController(name: '_EquipeControllerBase');

  @override
  dynamic startUp() {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.startUp');
    try {
      return super.startUp();
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic equipesDoTreinador(String uidTreinador) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.equipesDoTreinador');
    try {
      return super.equipesDoTreinador(uidTreinador);
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
  dynamic uploadPicture(String filePath, File file) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.uploadPicture');
    try {
      return super.uploadPicture(filePath, file);
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startGame(GameModel model) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.startGame');
    try {
      return super.startGame(model);
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateUser(String equipeId, dynamic idTreinador) {
    final _$actionInfo = _$_EquipeControllerBaseActionController.startAction(
        name: '_EquipeControllerBase.updateUser');
    try {
      return super.updateUser(equipeId, idTreinador);
    } finally {
      _$_EquipeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
equipeList: ${equipeList},
equipesDoTreinadorList: ${equipesDoTreinadorList}
    ''';
  }
}
