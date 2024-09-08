part of 'home_screen_bloc.dart';

class HomeScreenBlocState extends Equatable {

  final bool? isLoadingImage;
  final String? currentResponseFromImage;
  final List<Message>? messages;
  final bool? scrollScreen;

  const HomeScreenBlocState({
    this.isLoadingImage = false,
    this.currentResponseFromImage,
    this.messages = const [],
    this.scrollScreen,
  });

  HomeScreenBlocState copyWith({
    bool? isLoadingImage,
    String? currentResponseFromImage,
    List<Message>? messages,
    bool? scrollScreen,
  }){
    return 
      HomeScreenBlocState(
        isLoadingImage: isLoadingImage ?? this.isLoadingImage,
        currentResponseFromImage: currentResponseFromImage ?? this.currentResponseFromImage,
        messages : messages ?? this.messages,
        scrollScreen : scrollScreen ?? this.scrollScreen,
      ); 
  }

  @override
  List<Object?> get props => [
    isLoadingImage,
    currentResponseFromImage,
    messages,
    scrollScreen,
  ];
  

}




