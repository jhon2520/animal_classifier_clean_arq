class GeminiConstants{

  static const String model               = "gemini-1.5-flash-latest";
  static const String datapart            = "image/jpeg";
  static const double temperature         = 0.5;
  static const String textContent         = "¿Es esta imagen una planta, un animal o un hongo ? Toma el tiempo necesario para "
                "evaluar y así confirmar realmente qué organismo es. Devuelve 'planta', 'animal' u 'hongo' según corresponda";
  static const String textDetailedPromptPlant  = 
"Identify the plant in this image."
                        "Generate a detailed description of the organism, including its common name and scientific name if possible."
                        "Describe its distinctive characteristics as a species."
                        "Compare the plant to similar species and explain the differences."
                        "Classify the plant according to its ecosystem or natural habitat."
                        "Provide additional relevant information about the organism, such as:"
                        "medicinal properties or traditional uses"
                        "Format the text with bold, headings, and italics where appropriate."
                        "Always return the response in Spanish.";
    static const String textDetailedPromptAnimal  = 
"Identify the animal in this image."
                        "Generate a detailed description of the animal, including its common name and scientific name if possible."
                        "Describe its distinctive characteristics as a species."
                        "Compare the animal to similar species and explain the differences."
                        "Classify the animal according to its ecosystem or natural habitat."
                        "Provide additional relevant information about the organism, such as:"
                        "conservation status or threat level"
                        "Format the text with bold, headings, and italics where appropriate."
                        "Always return the response in Spanish.";
    static const String textDetailedPromptFungi  = 
"Identify the fungi in this image."
                        "Generate a detailed description of the fungi, including its common name and scientific name if possible."
                        "Describe its distinctive characteristics as a species."
                        "Compare the animal to similar species and explain the differences."
                        "Classify the animal according to its ecosystem or natural habitat."
                        "Provide additional relevant information about the organism, such as:"
                        "medicinal properties or traditional uses"
                        "Format the text with bold, headings, and italics where appropriate."
                        "Always return the response in Spanish.";



}