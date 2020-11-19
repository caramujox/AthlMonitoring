import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/dados_volley_repository.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/dados_volley_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/dadosVolley_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosVolleyService extends Disposable implements IDadosVolleyService {
  final IDadosVolleyRepository dadosVolleyRepository;

  DadosVolleyService({@required this.dadosVolleyRepository});

  @override
  void dispose() {}

  @override
  Future save(DadosVolleyModel model, GameModel game) {
    return dadosVolleyRepository.save(model, game);
  }

  @override
  Stream<List<DadosVolleyModel>> get() {
    return dadosVolleyRepository.get();
  }

  @override
  Stream<List<DadosVolleyModel>> getCon() {
    return dadosVolleyRepository.getCon();
  }

  @override
  Stream<List<DadosVolleyModel>> getPro() {
    return dadosVolleyRepository.getPro();
}

  @override
  Stream<List<DadosVolleyModel>> getConAtaque() {
    return dadosVolleyRepository.getConAtaque();
  }

  @override
  Stream<List<DadosVolleyModel>> getConBloqueio() {
    return dadosVolleyRepository.getConBloqueio();
  }

  @override
  Stream<List<DadosVolleyModel>> getConGenerico() {
    return dadosVolleyRepository.getConGenerico();
  }

  @override
  Stream<List<DadosVolleyModel>> getConSaque() {
    return dadosVolleyRepository.getConSaque();
  }

  @override
  Stream<List<DadosVolleyModel>> getProAtaque() {
    return dadosVolleyRepository.getProAtaque();
  }

  @override
  Stream<List<DadosVolleyModel>> getProBloqueio() {
    return dadosVolleyRepository.getProBloqueio();
  }

  @override
  Stream<List<DadosVolleyModel>> getProErroOponente() {
    return dadosVolleyRepository.getProErroOponente();
  }

  @override
  Stream<List<DadosVolleyModel>> getProSaque() {
    return dadosVolleyRepository.getProSaque();
  }
}