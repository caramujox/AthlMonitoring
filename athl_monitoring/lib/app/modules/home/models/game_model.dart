import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  final String equipeId, equipeAdv, nomeCompeticao;
  final DateTime dataGame;
  DocumentReference reference;

  GameModel(
      {this.equipeId,
      this.equipeAdv,
      this.nomeCompeticao,
      this.dataGame,
      this.reference});

  factory GameModel.fromDocument(DocumentSnapshot doc) {
    return GameModel(
        dataGame: doc['dataGame'],
        equipeAdv: doc['equipeAdv'],
        nomeCompeticao: doc['nomeCompetição'],
        equipeId: doc['equipeId']);
  }
}
