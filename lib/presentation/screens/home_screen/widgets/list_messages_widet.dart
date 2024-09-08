import 'package:cindy/core/constants/app_constants/index.dart';
import 'package:cindy/presentation/screens/home_screen/widgets/index.dart';
import 'package:cindy/presentation/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessageWidget extends StatefulWidget {
  const ListMessageWidget({super.key});

  @override
  State<ListMessageWidget> createState() => _ListMessageWidgetState();
}

class _ListMessageWidgetState extends State<ListMessageWidget> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final messages =
        context.select((HomeScreenBloc bloc) => bloc.state.messages) ?? [];

    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return BlocListener<HomeScreenBloc, HomeScreenBlocState>(
            listener: (context, state) {
              if (state.scrollScreen == true) {
                if (message.text != null) {
                  _scrollDown();
                }

                if (message.image != null) {
                  _scrollDown();
                }
              }
            },
            child: MessageWidget(
              text: message.text,
              image: message.image,
              isFromUser: message.fromUser,
            ),
          );
        },
      ),
    );
  }

  void _scrollDown({bool isImage = false}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (isImage) {
      controller.animateTo(
          controller.position.maxScrollExtent +
              AppConstantsLayout.cardImagesDefaultHeight +
              50,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut);
      return;
    }
    controller.animateTo(controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
