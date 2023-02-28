import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_experiments_method_channel.dart';

abstract class PlatformExperimentsPlatform extends PlatformInterface {
  /// Constructs a PlatformExperimentsPlatform.
  PlatformExperimentsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformExperimentsPlatform _instance = MethodChannelPlatformExperiments();

  /// The default instance of [PlatformExperimentsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformExperiments].
  static PlatformExperimentsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformExperimentsPlatform] when
  /// they register themselves.
  static set instance(PlatformExperimentsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
