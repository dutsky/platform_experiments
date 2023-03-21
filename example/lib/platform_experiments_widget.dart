import 'package:flutter/material.dart';
import 'package:platform_experiments/pigeon.dart';

class PlatformExperimentsWidget extends InheritedWidget {
  final CalculatorApi platformPlugin;

  const PlatformExperimentsWidget({
    required this.platformPlugin,
    required super.child,
    super.key,
  });

  static PlatformExperimentsWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlatformExperimentsWidget>();
  }

  @override
  bool updateShouldNotify(PlatformExperimentsWidget oldWidget) {
    return true;
  }
}
