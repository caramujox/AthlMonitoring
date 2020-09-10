import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class IUploadFileRepository{
  StorageUploadTask startUpload(String filePath, File file);
}