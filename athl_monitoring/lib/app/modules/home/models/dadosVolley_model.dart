import 'package:cloud_firestore/cloud_firestore.dart';

class DadosVolleyModel {
  final String tipo, jogador, ponto;

  DocumentReference reference;

  DadosVolleyModel({this.tipo, this.jogador, this.ponto, this.reference});

  factory DadosVolleyModel.fromDocument(DocumentSnapshot doc) {
    return DadosVolleyModel(
        tipo: doc['tipo'], jogador: doc['jogador'], ponto: doc['ponto']);
  }
}
