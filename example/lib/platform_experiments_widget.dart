import 'package:flutter/material.dart';
import 'package:platform_experiments/platform_experiments.dart';

class PlatformExperimentsWidget extends InheritedWidget {
  final PlatformExperiments platformPlugin;

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
