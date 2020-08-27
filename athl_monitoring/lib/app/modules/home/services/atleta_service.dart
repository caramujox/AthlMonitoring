import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/atleta_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtletaService extends Disposable implements IAtletaService {
  //dispose will be called automatically
  @override
  void dispose() {}


  
  final IAtletaRepository atletaRepository;
  AtletaService({@required this.atletaRepository});

  @override
  Future delete(AtletaModel atletaModel) {
    return atletaRepository.delete(atletaModel);
    }
  
  @override
  Stream<List<AtletaModel>> get() {
    return atletaRepository.get();
  }
  
  @override
  Future save(AtletaModel atletaModel) {
    return atletaRepository.save(atletaModel);
  }

  @override
  Future index(AtletaModel model) {
    return atletaRepository.index(model);
  }

}
