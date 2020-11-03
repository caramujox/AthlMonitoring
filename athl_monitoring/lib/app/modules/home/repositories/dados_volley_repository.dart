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
  Future save(DadosVolleyModel dadosVolleyModel) async {
    if (dadosVolleyModel.reference == null) {
      await Firestore.instance.collection('jogosVolley').document().setData({
        'tipo': dadosVolleyModel.tipo,
        'jogador': dadosVolleyModel.jogador,
        'ponto': dadosVolleyModel.ponto
      });
    } else {
      dadosVolleyModel.reference.updateData({
        'tipo': dadosVolleyModel.tipo,
        'jogador': dadosVolleyModel.jogador,
        'ponto': dadosVolleyModel.ponto
      });
    }
  }
}
