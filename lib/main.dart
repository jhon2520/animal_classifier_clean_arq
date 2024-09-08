import 'package:cindy/core/app/index.dart';
import 'package:flutter/material.dart';

import 'presentation/service_locator/service_locator.dart';

void main() {
  initServices();
  runApp(const GenerativeAISample());
}

