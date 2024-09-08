import 'package:cindy/core/constants/app_constants/index.dart';
import 'package:cindy/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isFromUser,
    this.image,
    this.text,
  });

  final Image? image;
  final String? text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            decoration: BoxDecoration(
              color: isFromUser
                  ? AppColors.primaryColor
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                if (text case final text?) MarkdownBody(data: text),
                if (image case final image?) 
                ClipRRect(
                  borderRadius:BorderRadius.circular(10) ,
                  child: Container(
                    constraints: const BoxConstraints(
                       maxHeight: AppConstantsLayout.cardImagesDefaultHeight,
                       minHeight: AppConstantsLayout.cardImagesDefaultHeight,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: image),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
