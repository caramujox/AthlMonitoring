import 'dart:io';

import 'package:athl_monitoring/app/modules/home/repositories/interfaces/upload_file_interface.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/upload_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UploadFileService extends Disposable implements IUploadFIleService{

  final IUploadFileRepository uploadFileRepository;

  UploadFileService({@required this.uploadFileRepository});

  @override
  void dispose() {

  }

  @override
  startUpload(String filePath, File file) {
   return uploadFileRepository.startUpload(filePath, file);
  }

  loadImage(String image){
    uploadFileRepository.loadImage(image);
  }
  
}