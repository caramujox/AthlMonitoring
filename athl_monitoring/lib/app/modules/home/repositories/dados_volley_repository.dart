import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/dados_volley_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosVolleyRepository extends Disposable
    implements IDadosVolleyRepository {
  final Firestore firestore;

  DadosVolleyRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future save(DadosVolleyModel model) async {
    if (model.reference == null) {
      await Firestore.instance.collection('jogosVolley').document().setData(
          {'tipo': model.tipo, 'jogador': model.jogador, 'ponto': model.ponto});
    } else {
      model.reference.updateData(
          {'tipo': model.tipo, 'jogador': model.jogador, 'ponto': model.ponto});
    }
  }

  @override
  Stream<List<DadosVolleyModel>> get() {
    return firestore.collection('dados').snapshots().map((query) =>
        query.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  }
}
