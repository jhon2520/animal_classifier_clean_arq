import 'dart:io';

import 'package:cindy/data/datasource/response_data_source.dart';
import 'package:cindy/domain/repository/index.dart';

class ResponseRespositoryImpl implements ResponseRepository{

  final ResponseDataSource _responseDataSource;

  ResponseRespositoryImpl(this._responseDataSource);


  @override
  Future<String> getResponseModelFromImage(File file) async{
    return await _responseDataSource.getResponseModelFromImage(file);
  }
  
  @override
  Future<String> getResponseModelFromText(String message) async{
    return  await _responseDataSource.getResponseModelFromText(message);
  }

}




