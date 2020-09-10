import 'dart:io';

import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/upload_service_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'atleta_controller.g.dart';

class AtletaController = _AtletaControllerBase with _$AtletaController;

abstract class _AtletaControllerBase with Store {
  final IAtletaService atletaService;
  final IUploadFIleService uploadService;

  _AtletaControllerBase( {IAtletaService this.atletaService, this.uploadService,}) {
    getList();
  }

  @observable
  ObservableStream<List<AtletaModel>> atletaList;

  @action
  getList() {
    atletaList = atletaService.get().asObservable();
  }

  @action
  save(AtletaModel model) {
    atletaService.save(model);
  }

  @action
  delete(AtletaModel model) {
    atletaService.delete(model);
  }

  @action
  uploadPicture(String filePath, File file){
    uploadService.startUpload(filePath, file);
  }

  Future<PickedFile> pickImage(ImageSource source) async {
    final _picker = ImagePicker();
    PickedFile selected = await _picker.getImage(source: source);
    return selected;
  }
}
