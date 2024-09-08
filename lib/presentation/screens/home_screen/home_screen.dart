import 'package:cindy/presentation/service_locator/service_locator.dart';
import 'package:cindy/presentation/shared/index.dart';
import 'package:cindy/presentation/state/index.dart';
import 'package:flutter/material.dart';
import 'package:cindy/core/constants/index.dart' show AppConstantsStrings;
import 'package:cindy/presentation/screens/home_screen/widgets/index.dart'
    show ChatWidget;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<HomeScreenBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstantsStrings.appTitle),
          backgroundColor: Theme.of(context).colorScheme.surface,
          actions: const [LogoComfamaWidget()],
        ),
        body: Builder(
          builder: (context) {
            return const ChatWidget();
          }
        ),
      ),
    );
  }
}
