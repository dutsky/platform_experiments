import 'package:flutter/material.dart';
import 'package:platform_experiments/platform_experiments.dart';
import 'package:platform_experiments_example/platform_experiments_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  late final PlatformExperiments? plugin;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    plugin = PlatformExperimentsWidget.of(context)?.platformPlugin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNumberController,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: secondNumberController,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            TextField(controller: resultController, readOnly: true),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _onMultiply, child: const Text('*')),
                ElevatedButton(onPressed: _onDivide, child: const Text('/')),
                ElevatedButton(onPressed: _onAdd, child: const Text('+')),
                ElevatedButton(onPressed: _onSubtract, child: const Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _do(Future<num?> Function(int, int)? operation) async {
    final first = int.parse(firstNumberController.text);
    final second = int.parse(secondNumberController.text);
    final result = await operation?.call(first, second);
    if (result == null) return;
    resultController.text = result.toString();
  }

  Future<void> _onMultiply() async => _do(plugin?.multiply);

  Future<void> _onDivide() async => _do(plugin?.divide);

  Future<void> _onAdd() async => _do(plugin?.add);

  Future<void> _onSubtract() async => _do(plugin?.subtract);
}
