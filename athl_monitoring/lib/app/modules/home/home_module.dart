import 'package:athl_monitoring/app/modules/home/controllers/equipe_controller.dart';
import 'package:athl_monitoring/app/modules/home/pages/gridequipe/gridEquipe_page.dart';
import 'package:athl_monitoring/app/modules/home/repositories/equipe_repository.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/equipe_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/equipe_services.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/equipe_service_interface.dart';

import 'pages/wrapper/wrapper_controller.dart';
import 'package:athl_monitoring/app/modules/home/controllers/atleta_controller.dart';
import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/pages/authpage/authpage_page.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/atleta_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/user_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/repositories/user_repository.dart';
import 'package:athl_monitoring/app/modules/home/services/auth_service.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/base_auth_interface.dart';
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
        Bind((i) => WrapperController()),
        Bind<IAtletaService>((i) => AtletaService(atletaRepository: i.get())),
        Bind<IAtletaRepository>(
            (i) => AtletaRepository(firestore: Firestore.instance)),
        Bind((i) => AtletaController(atletaService: i.get())),

        
        Bind<IEquipeService>((i) => EquipeService(equipeRepository: i.get())),
        Bind<IEquipeRepository>(
            (i) => EquipeRepository(firestore: Firestore.instance)),
        Bind((i) => EquipeController(equipeService: i.get())),

        Bind<IBaseAuth>((i) => AuthService(userRepository: i.get())),
        Bind<IUserRepository>(
            (i) => UserRepository(firestore: Firestore.instance)),
        Bind((i) => UserController(auth: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthpagePage()),
        Router('/atletas', child: (_, args) => HomePage())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
