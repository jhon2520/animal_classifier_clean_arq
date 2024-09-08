import 'package:flutter/material.dart';

import 'package:cindy/core/constants/index.dart' show AppConstantsStrings;
import 'package:cindy/core/theme/index.dart' show AppTheme;
import 'package:cindy/presentation/screens/index.dart' show HomeScreen;


class GenerativeAISample extends StatelessWidget {
  const GenerativeAISample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstantsStrings.appTitle,
      theme: AppTheme.getTheme(),
      home: const HomeScreen(),
    );
  }
}


