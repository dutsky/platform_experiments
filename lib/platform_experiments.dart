import 'platform_experiments_platform_interface.dart';

class PlatformExperiments {
  Future<int?> multiply(int first, int second) {
    return PlatformExperimentsPlatform.instance.multilpy(first, second);
  }

  Future<double?> divide(int first, int second) {
    return PlatformExperimentsPlatform.instance.divide(first, second);
  }

  Future<int?> add(int first, int second) {
    return PlatformExperimentsPlatform.instance.add(first, second);
  }

  Future<int?> subtract(int first, int second) {
    return PlatformExperimentsPlatform.instance.subtract(first, second);
  }
}
