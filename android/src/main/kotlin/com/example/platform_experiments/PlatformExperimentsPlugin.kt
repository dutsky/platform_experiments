package com.example.platform_experiments

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PlatformExperimentsPlugin */
class PlatformExperimentsPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private lateinit var calculator: Calculator

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_experiments")
        channel.setMethodCallHandler(this)
        calculator = CalculatorImpl()
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val args = call.arguments() as IntArray?
        val first = args?.get(0)
        val second = args?.get(1)

        if (first == null) throw NullPointerException("First argument is missing")
        if (second == null) throw NullPointerException("Second argument is missing")

        when (call.method) {
            "multiply" -> result.success(calculator.multiply(first, second))
            "divide" -> result.success(calculator.divide(first, second))
            "add" -> result.success(calculator.add(first, second))
            "subtract" -> result.success(calculator.subtract(first, second))
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
