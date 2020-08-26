import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/equipe_service_interface.dart';
import 'package:mobx/mobx.dart';
part 'equipe_controller.g.dart';

class EquipeController = _EquipeControllerBase with _$EquipeController;

abstract class _EquipeControllerBase with Store {
 final IEquipeService equipeService;

  _EquipeControllerBase({IEquipeService this.equipeService}){
    getList();
  }
  
  @observable
  ObservableStream<List<EquipeModel>> equipeList;

  @action
  getList(){
    equipeList = equipeService.get().asObservable();
  }

  
  @action
  save(EquipeModel model){
    equipeService.save(model);
  }

  @action
  delete(EquipeModel model){
    equipeService.delete(model);
  }
  
}