import 'package:athl_monitoring/app/modules/home/controllers/atleta_controller.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/atleta_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'services/atleta_service.dart';
import 'repositories/atleta_repository.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IAtletaService>((i) => AtletaService(atletaRepository: i.get())),
        Bind<IAtletaRepository>(
            (i) => AtletaRepository(firestore: Firestore.instance)),
        Bind((i) => AtletaController(atletaService: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
