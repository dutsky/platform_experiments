import Flutter
import UIKit

public class SwiftPlatformExperimentsPlugin: NSObject, FlutterPlugin, CalculatorApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger : FlutterBinaryMessenger = registrar.messenger()
    let api : CalculatorApi & NSObjectProtocol = SwiftPlatformExperimentsPlugin.init()
    CalculatorApiSetup.setUp(binaryMessenger: messenger, api: api)
  }

  func multiply(operands: Operands, completion: @escaping (Result<IntegerOperationResult, Error>) -> Void) {
    let result = operands.first * operands.second
    completion(Result.success(IntegerOperationResult(result: result)))
  }
  
  func divide(operands: Operands, completion: @escaping (Result<DoubleOperationResult, Error>) -> Void) {
    let result = Double(operands.first) / Double(operands.second)
    completion(Result.success(DoubleOperationResult(result: result)))
  }
  
  func add(operands: Operands, completion: @escaping (Result<IntegerOperationResult, Error>) -> Void) {
    let result = operands.first + operands.second
    completion(Result.success(IntegerOperationResult(result: result)))
  }
  
  func subtract(operands: Operands, completion: @escaping (Result<IntegerOperationResult, Error>) -> Void) {
    let result = operands.first - operands.second
    completion(Result.success(IntegerOperationResult(result: result)))
  }
}
