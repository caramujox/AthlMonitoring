import 'dart:io';

import 'package:athl_monitoring/app/modules/home/repositories/interfaces/upload_file_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UploadFileRepository extends Disposable implements IUploadFileRepository{
  final FirebaseStorage storage;
  StorageUploadTask _uploadTask;
  
  UploadFileRepository({@required this.storage});

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  StorageUploadTask startUpload(String filePath, File file) {
    return storage.ref().child(filePath).putFile(file);
  }
}