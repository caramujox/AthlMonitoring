import 'package:athl_monitoring/app/modules/home/pages/atletas_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/authpage/register_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/register_atleta.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_screen.dart';
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
        Bind<IBaseAuth>((i) => AuthService(userRepository: i.get())),
        Bind<IUserRepository>(
            (i) => UserRepository(firestore: Firestore.instance)),
        Bind((i) => UserController(auth: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthpagePage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/atletas', child: (_, args) => AtletaPage()),
        Router('/register', child: (_, args) => RegisterForm()),
        Router('/regAtleta', child: (_, args) => RegisterAtletaForm()),
        Router('/welcome', child: (_, args) => WelcomeScreen())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
