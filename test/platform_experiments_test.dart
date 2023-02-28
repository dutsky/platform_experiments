import 'package:flutter_test/flutter_test.dart';
import 'package:platform_experiments/platform_experiments.dart';
import 'package:platform_experiments/platform_experiments_platform_interface.dart';
import 'package:platform_experiments/platform_experiments_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformExperimentsPlatform
    with MockPlatformInterfaceMixin
    implements PlatformExperimentsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformExperimentsPlatform initialPlatform = PlatformExperimentsPlatform.instance;

  test('$MethodChannelPlatformExperiments is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformExperiments>());
  });

  test('getPlatformVersion', () async {
    PlatformExperiments platformExperimentsPlugin = PlatformExperiments();
    MockPlatformExperimentsPlatform fakePlatform = MockPlatformExperimentsPlatform();
    PlatformExperimentsPlatform.instance = fakePlatform;

    expect(await platformExperimentsPlugin.getPlatformVersion(), '42');
  });
}
