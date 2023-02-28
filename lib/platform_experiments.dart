
import 'platform_experiments_platform_interface.dart';

class PlatformExperiments {
  Future<String?> getPlatformVersion() {
    return PlatformExperimentsPlatform.instance.getPlatformVersion();
  }
}
