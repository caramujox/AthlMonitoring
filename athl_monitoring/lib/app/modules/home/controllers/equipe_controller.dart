import 'dart:io';

import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/equipe_service_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/upload_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'equipe_controller.g.dart';

class EquipeController = _EquipeControllerBase with _$EquipeController;

abstract class _EquipeControllerBase with Store {
  final IEquipeService equipeService;
  final IUploadFIleService uploadService;

  _EquipeControllerBase(
      {IEquipeService this.equipeService, this.uploadService}) {
    getList();
  }

  @observable
  ObservableStream<List<EquipeModel>> equipeList;

  @action
  getList() {
    equipeList = equipeService.get().asObservable();
    return equipeList;
  }

  @action
  save(EquipeModel model) {
    equipeService.save(model);
  }

  @action
  delete(EquipeModel model) {
    equipeService.delete(model);
  }

  @action
  uploadPicture(String filePath, File file) {
    return uploadService.startUpload(filePath, file);
  }

  Future<PickedFile> pickImage(ImageSource source) async {
    final _picker = ImagePicker();
    PickedFile selected = await _picker.getImage(source: source);
    return selected;
  }

  Future<Image> loadImage(String image) async {
    Image imageFile;
    await uploadService.loadImage(image).then((downloadURL) {
      imageFile = Image.network(
        downloadURL.toString(),
        fit: BoxFit.scaleDown,
      );
    });

    return imageFile;
  }
}
