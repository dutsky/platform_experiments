import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_experiments_platform_interface.dart';

/// An implementation of [PlatformExperimentsPlatform] that uses method channels.
class MethodChannelPlatformExperiments extends PlatformExperimentsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_experiments');

  @override
  Future<int?> multilpy(int first, int second) {
    return methodChannel.invokeMethod<int>('multiply', [first, second]);
  }

  @override
  Future<double?> divide(int first, int second) {
    return methodChannel.invokeMethod<double>('divide', [first, second]);
  }

  @override
  Future<int?> add(int first, int second) {
    return methodChannel.invokeMethod<int>('add', [first, second]);
  }

  @override
  Future<int?> subtract(int first, int second) {
    return methodChannel.invokeMethod<int>('subtract', [first, second]);
  }
}
