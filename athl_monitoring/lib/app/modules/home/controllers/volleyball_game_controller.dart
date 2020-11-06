import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/dadosVolley_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'volleyball_game_controller.g.dart';

class VolleyballGameController = _VolleyballGameControllerBase
    with _$VolleyballGameController;

abstract class _VolleyballGameControllerBase with Store {
  final IDadosVolleyService dadosVolleyService;

  @observable
  int value = 0;

  _VolleyballGameControllerBase({this.dadosVolleyService}) {
    startUp();
  }

  @action
  void increment() {
    value++;
  }

  @action
  save(DadosVolleyModel model) {
    dadosVolleyService.save(model);
  }

  @observable
  ObservableStream<List<DadosVolleyModel>> dadosList;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListPro;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListCon;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListConAtaque;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListConBloqueio;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListConGenerico;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListConSaque;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListProAtaque;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListProBloqueio;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListProErroOponente;
  @observable
  ObservableStream<List<DadosVolleyModel>> dadosListProSaque;

  @action
  getList() {
    dadosList = dadosVolleyService.get().asObservable();
    return dadosList;
  }

  @action
  getPro() {
    dadosListPro = dadosVolleyService.getPro().asObservable();
    return dadosListPro;
  }

  @action
  getCon() {
    dadosListCon = dadosVolleyService.getPro().asObservable();
    return dadosListCon;
  }

  @action
  getConAtaque() {
    dadosListConAtaque = dadosVolleyService.getConAtaque().asObservable();
    return dadosListConAtaque;
  }

  @action
  getConBloqueio() {
    dadosListConBloqueio = dadosVolleyService.getConBloqueio().asObservable();
    return dadosListConBloqueio;
  }

  @action
  getConGenerico() {
    dadosListConGenerico = dadosVolleyService.getConGenerico().asObservable();
    return dadosListConGenerico;
  }

  @action
  getConSaque() {
    dadosListConSaque = dadosVolleyService.getConSaque().asObservable();
    return dadosListConSaque;
  }

  @action
  getProAtaque() {
    dadosListProAtaque = dadosVolleyService.getProAtaque().asObservable();
    return dadosListProAtaque;
  }

  @action
  getProBloqueio() {
    dadosListProBloqueio = dadosVolleyService.getProBloqueio().asObservable();
    return dadosListProBloqueio;
  }

  @action
  getProErroOponente() {
    dadosListProErroOponente =
        dadosVolleyService.getProErroOponente().asObservable();
    return dadosListProErroOponente;
  }

  @action
  getProSaque() {
    dadosListProSaque = dadosVolleyService.getProSaque().asObservable();
    return dadosListProSaque;
  }

  @action
  startUp() async {
    getList();
    getPro();
    getProAtaque();
    getProBloqueio();
    getProErroOponente();
    getProSaque();
    getCon();
    getConAtaque();
    getConBloqueio();
    getConGenerico();
    getConSaque();
  }
}
