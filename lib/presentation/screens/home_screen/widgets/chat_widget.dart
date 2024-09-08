import 'package:cindy/presentation/screens/home_screen/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
  });

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {


  late TextEditingController _textController;
  late FocusNode _textFieldFocus;
  late ImagePicker _picker;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textFieldFocus = FocusNode();
    _picker = ImagePicker();
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [

          const ListMessageWidget(),
          RowActionButtons(
            picker: _picker,
            textController: _textController,
            focusNode: _textFieldFocus,
          )
        ],
      ),
    );
  }






}
