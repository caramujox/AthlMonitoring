import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  final String codEquipe, equipeAdv, nomeCompeticao, nomeEquipe;
  final DateTime dataGame;
  DocumentReference reference;

  GameModel(
      {this.codEquipe,
      this.equipeAdv,
      this.nomeCompeticao,
      this.dataGame,
      this.nomeEquipe,
      this.reference});

  factory GameModel.fromDocument(DocumentSnapshot doc) {
    return GameModel(
        dataGame: doc['dataGame'],
        equipeAdv: doc['equipeAdv'],
        nomeCompeticao: doc['nomeCompetição'],
        nomeEquipe: doc['nomeEquipe'],
        codEquipe: doc['codEquipe']);
  }
}
