import 'dart:io';

abstract class IUploadFIleService{
  startUpload(String filePath, File file);
  Future<dynamic> loadImage(String image);
}