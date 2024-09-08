import 'dart:io';

abstract class ResponseDataSource{

  Future<String> getResponseModelFromImage(File file);
  Future<String> getResponseModelFromText(String message);

}