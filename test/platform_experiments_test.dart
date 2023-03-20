import 'package:flutter_test/flutter_test.dart';
import 'package:platform_experiments/platform_experiments.dart';
import 'package:platform_experiments/platform_experiments_platform_interface.dart';
import 'package:platform_experiments/platform_experiments_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformExperimentsPlatform
    with MockPlatformInterfaceMixin
    implements PlatformExperimentsPlatform {
  @override
  Future<int?> multilpy(int first, int second) => Future.value(first * second);

  @override
  Future<double?> divide(int first, int second) => Future.value(first / second);

  @override
  Future<int?> add(int first, int second) => Future.value(first + second);

  @override
  Future<int?> subtract(int first, int second) => Future.value(first - second);
}

void main() {
  final PlatformExperimentsPlatform initialPlatform =
      PlatformExperimentsPlatform.instance;
  final PlatformExperiments platformExperimentsPlugin = PlatformExperiments();
  final MockPlatformExperimentsPlatform fakePlatform =
      MockPlatformExperimentsPlatform();
  PlatformExperimentsPlatform.instance = fakePlatform;

  const first = 3;
  const second = 2;
  const secondZero = 0;

  test('$MethodChannelPlatformExperiments is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformExperiments>());
  });

  test('multiply', () async {
    expect(
      await platformExperimentsPlugin.multiply(first, second),
      6,
    );
  });
  test('divide', () async {
    expect(
      await platformExperimentsPlugin.divide(first, second),
      1.5,
    );
  });

  test('divideByZero', () async {
    expect(
      await platformExperimentsPlugin.divide(first, secondZero),
      double.infinity,
    );
  });

  test('add', () async {
    expect(
      await platformExperimentsPlugin.add(first, second),
      5,
    );
  });
  test('subtract', () async {
    expect(
      await platformExperimentsPlugin.subtract(first, second),
      1,
    );
  });
}
