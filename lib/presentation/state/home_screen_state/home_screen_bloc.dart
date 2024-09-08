import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cindy/domain/usecase/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'home_screen_bloc_event.dart';
part 'home_screen_bloc_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenBlocEvent, HomeScreenBlocState> {
  
  final ResponseUsecase _responseUsecase;

  HomeScreenBloc(this._responseUsecase) : super(const HomeScreenBlocState()) {
    on<ChangeIsLoadingEvent>(_changeIsLoading);
    on<GetResponseFromImageEvent>(_getResponseFromImage);
    on<AddMessageToListEvent>(_addMessageToList);
    on<GetResponseFromTextEvent>(_getResponseFromText);
  }

  FutureOr<void> _changeIsLoading(
      ChangeIsLoadingEvent event, Emitter<HomeScreenBlocState> emit) {}

  FutureOr<void> _getResponseFromImage(GetResponseFromImageEvent event,
      Emitter<HomeScreenBlocState> emit) async {
    emit(state.copyWith(isLoadingImage: true, scrollScreen: true));
    if (event.file == null) {
      return;
    }

    // imagen
    final imageUpload =
        ((image: Image.file(event.file!), text: null, fromUser: true));
    final newMessagesWithImage = _addMessage(state.messages, imageUpload);
    emit(state.copyWith(
      messages: newMessagesWithImage,
    ));

    final String response =
        await _responseUsecase.getResponseModelFromImage(event.file!);

    // repuesta
    final newMessages = _addMessage(
        state.messages, (image: null, text: response, fromUser: false));
    emit(state.copyWith(
        currentResponseFromImage: response,
        messages: newMessages,
        isLoadingImage: false,
        scrollScreen: true,  
      ));
  }

  FutureOr<void> _addMessageToList(
      AddMessageToListEvent event, Emitter<HomeScreenBlocState> emit) {
    final newMessages = _addMessage(state.messages, event.newMessage!);
    emit(state.copyWith(
      messages: newMessages,
    ));
  }

  List<Message> _addMessage(
      List<Message>? currentMessages, Message newMessage) {
    return [...currentMessages ?? [], newMessage];
  }

  FutureOr<void> _getResponseFromText(
      GetResponseFromTextEvent event, Emitter<HomeScreenBlocState> emit) async {
    emit(state.copyWith(isLoadingImage: true, scrollScreen: true));
    final newMessagesFromUser = _addMessage(
        state.messages, (image: null, text: event.message, fromUser: true));
    emit(state.copyWith(messages: newMessagesFromUser));

    final String response =
        await _responseUsecase.getResponseModelFromText(event.message!);

    final newMessagesFromService = _addMessage(
        state.messages, (image: null, text: response, fromUser: false));
    emit(state.copyWith(messages: newMessagesFromService, scrollScreen: true,isLoadingImage: false));

  }
}

typedef Message = ({Image? image, String? text, bool fromUser});
