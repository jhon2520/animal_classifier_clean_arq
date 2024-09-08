import 'dart:io';

abstract class ResponseRepository{

  Future<String> getResponseModelFromImage(File file);
  Future<String> getResponseModelFromText(String message);
}


