import 'package:pigeon/pigeon.dart';

class Operands {
  final int first;
  final int second;

  Operands({required this.first, required this.second});
}

class IntegerOperationResult {
  final int result;

  IntegerOperationResult({required this.result});
}

class DoubleOperationResult {
  final double result;

  DoubleOperationResult({required this.result});
}

@HostApi()
abstract class CalculatorApi {
  @async
  IntegerOperationResult multiply(Operands operands);

  @async
  DoubleOperationResult divide(Operands operands);

  @async
  IntegerOperationResult add(Operands operands);

  @async
  IntegerOperationResult subtract(Operands operands);
}
