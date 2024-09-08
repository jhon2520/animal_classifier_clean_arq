import 'package:cindy/core/constants/models_constants/gemini_contants.dart';

enum TypeContentEnum{
  animal("animal", GeminiConstants.textDetailedPromptAnimal),
  plant("planta",GeminiConstants.textDetailedPromptPlant),
  fungi("hongo", GeminiConstants.textDetailedPromptFungi);

  final String name;
  final String content;
  const TypeContentEnum(this.name, this.content);


}