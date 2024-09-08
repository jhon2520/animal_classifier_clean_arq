import 'dart:io';

import 'package:cindy/core/constants/app_constants/index.dart';
import 'package:cindy/core/enums/index.dart';
import 'package:cindy/core/utils/models/index.dart';
import 'package:cindy/data/datasource/response_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ResponseDataSourceGemini implements ResponseDataSource {
  
  @override
  Future<String> getResponseModelFromImage(File file) async {
    final GenerativeModel generativeModel = GeminiUtils.getGeminiModel();
    final Uint8List bytes = await file.readAsBytes();

    final List<Content> generalContent = GeminiUtils.getInitContent(bytes);

    final GenerateContentResponse response =
        await generativeModel.generateContent(generalContent);
    final TypeContentEnum? subjectResponse =
        GeminiUtils.validateSubject(response.text);
    if (subjectResponse == null) {
      return AppConstantsStrings.messageNoResponseImage;
    }

    final List<Content> detailedPrompt =
        GeminiUtils.getGeneralContent(bytes, subjectResponse.content);
    final GenerateContentResponse detailedResponse =
        await generativeModel.generateContent(detailedPrompt);
    final String? detailedText = detailedResponse.text;
    return detailedText ?? AppConstantsStrings.messageNoResponse;
  }
  
  @override
  Future<String> getResponseModelFromText(String message) async{
    final GenerativeModel generativeModel = GeminiUtils.getGeminiModel();

    final ChatSession chat = generativeModel.startChat();
    final GenerateContentResponse response = await chat.sendMessage(Content.text(message));
    final String? text = response.text;
    return text ??  AppConstantsStrings.messageNoResponse;
}




}