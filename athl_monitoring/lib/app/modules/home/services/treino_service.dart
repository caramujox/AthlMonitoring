import 'package:athl_monitoring/app/modules/home/models/treino_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/treino_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/treino_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TreinoService extends Disposable implements ITreinoService {
  final ITreinoRepository treinoRepository;

  TreinoService({@required this.treinoRepository});

  @override
  void dispose() {}

  @override
  Future save(TreinoModel model) {
    return treinoRepository.save(model);
  }
}
