import 'dart:io';

import 'package:cindy/domain/repository/index.dart';

class ResponseUsecase{

  final ResponseRepository _repository;

  ResponseUsecase(this._repository);

  Future<String> getResponseModelFromImage(File file){
    return _repository.getResponseModelFromImage(file);
  }

  Future<String> getResponseModelFromText(String message){
    return _repository.getResponseModelFromText(message);
  }

}