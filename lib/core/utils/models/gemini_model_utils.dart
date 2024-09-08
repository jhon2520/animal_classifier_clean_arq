import 'dart:typed_data';

import 'package:cindy/core/constants/models_constants/index.dart';
import 'package:cindy/core/enums/index.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiUtils{

  GeminiUtils._();

  static GenerativeModel getGeminiModel(){
    return  GenerativeModel(
        model: GeminiConstants.model,
        generationConfig: GenerationConfig(
          temperature: GeminiConstants.temperature
        ),
        apiKey:const String.fromEnvironment('API_KEY')
        );
  }

  static List<Content> getInitContent(Uint8List int8List){
    return [
      Content.multi([
        DataPart(GeminiConstants.datapart, int8List),
        TextPart(GeminiConstants.textContent),
      ]),
    ];
  }

  static List<Content> getGeneralContent(Uint8List int8List, String textContent){
    return [
      Content.multi([
        DataPart(GeminiConstants.datapart, int8List),
        TextPart(textContent),
      ]),
    ];
  }

  static TypeContentEnum? validateSubject(String? response){

    if(response == null){
      return null;
    }

    if(response.contains(TypeContentEnum.animal.name)){
      return TypeContentEnum.animal;
    }
    if(response.contains(TypeContentEnum.plant.name)){
      return TypeContentEnum.plant;
    }
    if(response.contains(TypeContentEnum.fungi.name)){
      return TypeContentEnum.fungi;
    }

    return null;

  }



}