import 'dart:io';

import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/base_auth_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/upload_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'atleta_controller.g.dart';

class AtletaController = _AtletaControllerBase with _$AtletaController;

abstract class _AtletaControllerBase with Store {
  final IAtletaService atletaService;
  final IUploadFIleService uploadService;
  final IBaseAuth auth;

  _AtletaControllerBase( {this.atletaService, this.uploadService, this.auth,}) {
    // getList();
    getUser();
  }

  @observable
  ObservableFuture<dynamic> user;
  
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
  register(AtletaModel model, UserModel firebaseUser) {
    atletaService.register(model, firebaseUser);
  }

  @action
  delete(AtletaModel model) {
    atletaService.delete(model);
  }

  @action
  uploadPicture(String filePath, File file){
    return uploadService.startUpload(filePath, file);
  }

    @action
  getUser() {    
    user = auth.getUserModel().asObservable();
    return user;
  }

  Future<PickedFile> pickImage(ImageSource source) async {
    final _picker = ImagePicker();
    PickedFile selected = await _picker.getImage(source: source);
    return selected;
  }

  Future<Image> loadImage(String image) async{
    Image imageFile;
    await uploadService.loadImage(image).then((downloadURL) {
      imageFile = Image.network(downloadURL.toString(),
      fit: BoxFit.scaleDown,);
    });    
    return imageFile;
  }
}
