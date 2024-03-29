import 'package:flutter/material.dart';
import 'package:platform_experiments/platform_experiments.dart';
import 'package:platform_experiments_example/calculator_screen.dart';
import 'package:platform_experiments_example/platform_experiments_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformExperimentsWidget(
      platformPlugin: PlatformExperiments(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
