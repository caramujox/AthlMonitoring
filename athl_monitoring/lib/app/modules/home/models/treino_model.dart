import 'package:cloud_firestore/cloud_firestore.dart';

class TreinoModel {
  final String duracao, codEquipe, nome, descricao;
  final DateTime data;
  DocumentReference reference;

  TreinoModel(
      {this.data,
      this.duracao,
      this.codEquipe,
      this.nome,
      this.descricao,
      this.reference});

  factory TreinoModel.fromDocument(DocumentSnapshot doc) {
    return TreinoModel(
        data: doc['data'],
        nome: doc['nome'],
        descricao: doc['descricao'],
        codEquipe: doc['codEquipe'],
        duracao: doc['duracao']);
  }
}
