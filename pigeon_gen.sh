#!/bin/sh

flutter pub run pigeon \
  --input api/calculator_api.dart \
  --dart_out lib/pigeon.dart \
  --experimental_swift_out ios/Classes/Pigeon.swift \
  --experimental_kotlin_out android/src/main/kotlin/com/example/platform_experiments/Pigeon.kt \
  --experimental_kotlin_package "com.example.pigeon"