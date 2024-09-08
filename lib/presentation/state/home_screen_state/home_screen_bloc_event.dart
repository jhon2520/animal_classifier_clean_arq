part of 'home_screen_bloc.dart';

abstract class HomeScreenBlocEvent extends Equatable{

  const HomeScreenBlocEvent();

  @override
  List<Object?> get props => [];
}


final class ChangeIsLoadingEvent extends HomeScreenBlocEvent{
  const ChangeIsLoadingEvent();
}

final class GetResponseFromImageEvent extends HomeScreenBlocEvent{

  final File? file;
  const GetResponseFromImageEvent({this.file});
  @override
  List<Object?> get props => [file];
}

final class AddMessageToListEvent extends HomeScreenBlocEvent{
  final Message? newMessage;
  const AddMessageToListEvent({this.newMessage});
  @override
  List<Object?> get props => [newMessage];
}

final class GetResponseFromTextEvent extends HomeScreenBlocEvent{
  final String? message;
  const GetResponseFromTextEvent({this.message});
  @override
  List<Object?> get props => [message];
}