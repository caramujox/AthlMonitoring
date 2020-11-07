import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/equipe_repository.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/equipe_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/equipe_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EquipeService extends Disposable implements IEquipeService {
  final IEquipeRepository equipeRepository;

  EquipeService({@required this.equipeRepository});

  @override
  Future delete(EquipeModel model) {
    return equipeRepository.delete(model);
  }

  @override
  void dispose() {}

  @override
  Stream<List<EquipeModel>> get() {
    return equipeRepository.get();
  }

  @override
  Stream<List<EquipeModel>> getEquipesDoTreinador(String uidTreinador) {
    return equipeRepository.getEquipesDoTreinador(uidTreinador);
  }

  @override
  Future index(EquipeModel model) {
    return equipeRepository.index(model);
  }

  @override
  Future save(EquipeModel model) {
    return equipeRepository.save(model);
  }

  @override
  Future startGame(GameModel model) {
    return equipeRepository.startGame(model);
  }

  @override
  Future updateUser(String equipeId, idTreinador) {
    return equipeRepository.updateUser(equipeId, idTreinador);
  }
}
