import 'dart:io';

abstract class IUploadFIleService{
  startUpload(String filePath, File file);
}