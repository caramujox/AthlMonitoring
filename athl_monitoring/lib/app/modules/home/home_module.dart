import 'package:athl_monitoring/app/modules/home/pages/game/volleyball_game/volleyball_game_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/pre_game_page/pre_game_page.dart';
import 'package:athl_monitoring/app/modules/home/repositories/dados_volley_repository.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/dados_volley_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/dadosVolley_service.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/dadosVolley_service_interface.dart';

import 'controllers/volleyball_game_controller.dart';

import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_atleta_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_register_atleta.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_register_treinador.dart';
import 'package:athl_monitoring/app/modules/home/pages/wrapper/wrapper_page.dart';

import 'package:athl_monitoring/app/modules/home/pages/selec_atletas_pages.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_atleta.dart';
import 'package:athl_monitoring/app/modules/home/pages/gridequipe/gridEquipe_page.dart';

import 'package:athl_monitoring/app/modules/home/pages/register_equipe.dart';
import 'package:athl_monitoring/app/modules/home/pages/gridequipe/gridEquipe_page.dart';

import 'package:athl_monitoring/app/modules/home/repositories/interfaces/upload_file_interface.dart';
import 'package:athl_monitoring/app/modules/home/repositories/upload_file_repository.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/upload_service_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/upload_file_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'pages/image_caputre/image_caputre_controller.dart';
import 'package:athl_monitoring/app/modules/home/controllers/equipe_controller.dart';
import 'package:athl_monitoring/app/modules/home/pages/atletas_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/authpage/register_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/register_atleta.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_screen.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_treinador.dart';
import 'package:athl_monitoring/app/modules/home/repositories/equipe_repository.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/equipe_repository_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/equipe_services.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/equipe_service_interface.dart';
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
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //AtletasPage
        Bind<IAtletaService>((i) => AtletaService(atletaRepository: i.get())),
        Bind<IUploadFIleService>(
            (i) => UploadFileService(uploadFileRepository: i.get())),
        Bind<IAtletaRepository>(
            (i) => AtletaRepository(firestore: Firestore.instance)),
        Bind<IUploadFileRepository>((i) => UploadFileRepository(
            storage: FirebaseStorage(
                storageBucket: "gs://athlmonitoring-62273.appspot.com"))),
        Bind((i) => AtletaController(
            atletaService: i.get(), uploadService: i.get(), auth: i.get())),

        //EquipesPages
        Bind<IEquipeService>((i) => EquipeService(equipeRepository: i.get())),
        Bind<IEquipeRepository>(
            (i) => EquipeRepository(firestore: Firestore.instance)),
        Bind<IEquipeService>((i) => EquipeService(equipeRepository: i.get())),
        Bind((i) =>
            EquipeController(equipeService: i.get(), uploadService: i.get())),

        //Auth and Users
        Bind<IBaseAuth>((i) => AuthService(userRepository: i.get())),
        Bind<IUserRepository>(
            (i) => UserRepository(firestore: Firestore.instance)),
        Bind((i) => UserController(auth: i.get())),

        //Captures
        Bind((i) => ImageCaputreController()),

        //Dados Volley
        Bind<IDadosVolleyService>(
            (i) => DadosVolleyService(dadosVolleyRepository: i.get())),
        Bind<IDadosVolleyRepository>(
            (i) => DadosVolleyRepository(firestore: Firestore.instance)),
        Bind((i) => VolleyballGameController(dadosVolleyService: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PreGamePagePage()),
        Router('/welcomeTreinador', child: (_, args) => WelcomePageTreinador()),
        Router('/welcomeAtleta', child: (_, args) => WelcomeAtletaPage()),
        Router('/atletas', child: (_, args) => AtletaPage()),
        Router('/authpage', child: (_, args) => AuthpagePage()),
        Router('/register', child: (_, args) => RegisterForm()),
        Router('/regAtleta', child: (_, args) => RegisterAtletaForm()),
        Router('/regEquipes', child: (_, args) => RegisterEquipeForm()),
        Router('/welcome', child: (_, args) => WelcomeScreen()),
        Router('/pregame', child: (_, args) => PreGamePagePage()),
        Router('/selecAtleta', child: (_, args) => SelecAtleta()),
        Router('/equipes', child: (_, args) => GridEquipePage()),
        Router('/welcomeRegisterAtleta',
            child: (_, args) => WelcomeRegisterAtleta()),
        Router('/welcomeRegisterTreinador',
            child: (_, args) => WelcomeRegisterTreinador()),
        Router('/volleyballGame',
            child: (_, args) => VolleyballGame(gameModel: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
