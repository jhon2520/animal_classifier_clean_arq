import 'package:cindy/core/constants/index.dart';
import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 238, 43, 123),
              strokeWidth: 1,
            )),
        Text(AppConstantsStrings.labelLoading, style:  TextStyle(color: Colors.white, fontSize: 10),)
      ],
    );
  }
}
