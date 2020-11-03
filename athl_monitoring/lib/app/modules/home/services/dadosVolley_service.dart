import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/dados_volley_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/dadosVolley_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosVolleyService extends Disposable implements IDadosVolleyService {
  final IDadosVolleyRepository dadosVolleyRepository;

  DadosVolleyService({@required this.dadosVolleyRepository});

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
