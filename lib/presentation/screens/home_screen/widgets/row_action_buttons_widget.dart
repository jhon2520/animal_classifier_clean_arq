import 'dart:io';

import 'package:cindy/core/constants/index.dart';
import 'package:cindy/core/style/app_colors.dart';
import 'package:cindy/presentation/screens/home_screen/constants/home_screen_strings.dart';
import 'package:cindy/presentation/shared/index.dart';
import 'package:cindy/presentation/state/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RowActionButtons extends StatefulWidget {
  final TextEditingController textController;
  final ImagePicker picker;
  final FocusNode focusNode;

  const RowActionButtons(
      {super.key,
      required this.textController,
      required this.picker,
      required this.focusNode,
      
      });

  @override
  State<RowActionButtons> createState() => _RowActionButtonsState();
}

class _RowActionButtonsState extends State<RowActionButtons> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Builder(builder: (context) {
        final bool isLoading = context
                .select((HomeScreenBloc bloc) => bloc.state.isLoadingImage) ??
            false;

        if(isLoading){
          return  const CustomLoaderWidget() ;
        }

        return Row(
          children: [      
            Expanded(
              child: TextField(
                autofocus: true,
                enabled: !isLoading,
                readOnly: isLoading,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: isLoading
                      ? HomeScreenStrings.labelLoading
                      : HomeScreenStrings.labelEnterMessage,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                controller: widget.textController,
                onSubmitted: _sendMessage,
                onChanged: isLoading ? null : (value) {},
              ),
            ),
            const SizedBox.square(dimension: 5),
            IconButton(
              onPressed: !isLoading
                  ? () async {
                      _pickImage(ImageSource.camera);
                    }
                  : null,
              icon: Icon(
                Icons.camera_enhance,
                color: isLoading
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
            IconButton(
              onPressed: !isLoading
                  ? () async {
                      _pickImage(ImageSource.gallery);
                    }
                  : null,
              icon: Icon(
                Icons.image,
                color: isLoading
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
            IconButton(
              onPressed: isLoading
                  ? null
                  : () => _sendMessage(widget.textController.text),
              icon: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        );
      }),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    
    await widget.picker.pickImage(source: source).then(
      (value) {
        if (value != null) {
          final File imageFile = File(value.path);
          context
              .read<HomeScreenBloc>()
              .add(GetResponseFromImageEvent(file: imageFile));
        }
      },
    );
  }

  Future<void> _sendMessage(String message) async {

    if (message.isEmpty) {
      _showError(HomeScreenStrings.errorNoInput);
      widget.focusNode.requestFocus();
      return;
    }

    context
        .read<HomeScreenBloc>()
        .add(GetResponseFromTextEvent(message: message));

    widget.textController.clear();
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppConstantsStrings.labelSomethingWentWrong),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppConstantsStrings.labelOk),
            ),
          ],
        );
      },
    );
  }

}
