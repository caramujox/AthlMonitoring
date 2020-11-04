import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/equipe_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

class EquipeRepository extends Disposable implements IEquipeRepository {
  final Firestore firestore;

  EquipeRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(EquipeModel equipeModel) {
    return equipeModel.reference.delete();
  }

  @override
  Stream<List<EquipeModel>> get() {
    return firestore.collection('equipe').snapshots().map((query) =>
        query.documents.map((doc) => EquipeModel.fromDocument(doc)).toList());
  }

  @override
  Future<EquipeModel> index(EquipeModel equipeModel) {
    return Firestore.instance
        .collection('equipe')
        .document(equipeModel.codEquipe)
        .get()
        .then((doc) => EquipeModel.fromDocument(doc));
  }

  @override
  Future save(EquipeModel equipeModel) async {
    if (equipeModel.reference == null) {
      await Firestore.instance
          .collection('equipe')
          .document(equipeModel.codEquipe)
          .setData({
        'nome': equipeModel.nome,
        'codEquipe': equipeModel.codEquipe,
        'modalidade': equipeModel.modalidade,
        'urlPhoto': equipeModel.urlPhoto
      });
    } else {
      equipeModel.reference.updateData({
        'nome': equipeModel.nome,
        'codEquipe': equipeModel.codEquipe,
        'modalidade': equipeModel.modalidade,
        'urlPhoto': equipeModel.urlPhoto
      });
    }
  }

  @override
  Future startGame(GameModel gameModel) async {
    await Firestore.instance
        .collection('jogosVolley')
        .document('${gameModel.equipeId} + ${gameModel.dataGame}')
        .setData({
      'equipeId': gameModel.equipeId,
      'equipeAdv': gameModel.equipeAdv,
      'nomeCompeticao': gameModel.nomeCompeticao,
      'dataGame': gameModel.dataGame
    });
  }
}
