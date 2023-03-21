// Autogenerated from Pigeon (v9.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class Operands {
  Operands({
    required this.first,
    required this.second,
  });

  int first;

  int second;

  Object encode() {
    return <Object?>[
      first,
      second,
    ];
  }

  static Operands decode(Object result) {
    result as List<Object?>;
    return Operands(
      first: result[0]! as int,
      second: result[1]! as int,
    );
  }
}

class IntegerOperationResult {
  IntegerOperationResult({
    required this.result,
  });

  int result;

  Object encode() {
    return <Object?>[
      result,
    ];
  }

  static IntegerOperationResult decode(Object result) {
    result as List<Object?>;
    return IntegerOperationResult(
      result: result[0]! as int,
    );
  }
}

class DoubleOperationResult {
  DoubleOperationResult({
    required this.result,
  });

  double result;

  Object encode() {
    return <Object?>[
      result,
    ];
  }

  static DoubleOperationResult decode(Object result) {
    result as List<Object?>;
    return DoubleOperationResult(
      result: result[0]! as double,
    );
  }
}

class _CalculatorApiCodec extends StandardMessageCodec {
  const _CalculatorApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is DoubleOperationResult) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is IntegerOperationResult) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is Operands) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return DoubleOperationResult.decode(readValue(buffer)!);
      case 129: 
        return IntegerOperationResult.decode(readValue(buffer)!);
      case 130: 
        return Operands.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class CalculatorApi {
  /// Constructor for [CalculatorApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CalculatorApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _CalculatorApiCodec();

  Future<IntegerOperationResult> multiply(Operands arg_operands) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CalculatorApi.multiply', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_operands]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as IntegerOperationResult?)!;
    }
  }

  Future<DoubleOperationResult> divide(Operands arg_operands) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CalculatorApi.divide', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_operands]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as DoubleOperationResult?)!;
    }
  }

  Future<IntegerOperationResult> add(Operands arg_operands) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CalculatorApi.add', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_operands]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as IntegerOperationResult?)!;
    }
  }

  Future<IntegerOperationResult> subtract(Operands arg_operands) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CalculatorApi.subtract', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_operands]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as IntegerOperationResult?)!;
    }
  }
}