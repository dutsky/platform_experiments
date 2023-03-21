package com.example.platform_experiments

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** PlatformExperimentsPlugin */
class PlatformExperimentsPlugin : FlutterPlugin, CalculatorApi {
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        CalculatorApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        CalculatorApi.setUp(binding.binaryMessenger, null)
    }

    override fun multiply(
        operands: Operands,
        callback: (Result<IntegerOperationResult>) -> Unit
    ) {
        val result = IntegerOperationResult(operands.first * operands.second)
        callback(Result.success(result))
    }

    override fun divide(
        operands: Operands,
        callback: (Result<DoubleOperationResult>) -> Unit
    ) {
        val result = DoubleOperationResult(operands.first.toDouble() / operands.second)
        callback(Result.success(result))
    }

    override fun add(
        operands: Operands,
        callback: (Result<IntegerOperationResult>) -> Unit
    ) {
        val result = IntegerOperationResult(operands.first + operands.second)
        callback(Result.success(result))
    }

    override fun subtract(
        operands: Operands,
        callback: (Result<IntegerOperationResult>) -> Unit
    ) {
        val result = IntegerOperationResult(operands.first - operands.second)
        callback(Result.success(result))
    }
}
