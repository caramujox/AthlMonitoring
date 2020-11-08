import 'package:athl_monitoring/app/modules/home/models/treino_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/treino_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TreinoRepository extends Disposable implements ITreinoRepository {
  final Firestore firestore;

  TreinoRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future save(TreinoModel model) async {
    if (model.reference == null) {
      await Firestore.instance.collection('treino').document().setData({
        'nome': model.nome,
        'data': model.data,
        'duracao': model.duracao,
        'codEquipe': model.codEquipe,
        'descricao': model.descricao,
      });
    } else {
      model.reference.updateData({
        'tipo': model.nome,
        'jogador': model.data,
        'ponto': model.duracao,
        'duracao': model.duracao,
        'codEquipe': model.codEquipe,
        'descricao': model.descricao,
      });
    }
  }
}
