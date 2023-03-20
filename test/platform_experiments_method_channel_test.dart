import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_experiments/platform_experiments_method_channel.dart';

void main() {
  MethodChannelPlatformExperiments platform =
      MethodChannelPlatformExperiments();
  const MethodChannel channel = MethodChannel('platform_experiments');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 6;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.multilpy(2, 3), 6);
  });
}
