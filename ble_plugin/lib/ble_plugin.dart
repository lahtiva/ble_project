import 'dart:async';
import 'package:flutter/services.dart';

class BlePlugin {
  static const _channel = MethodChannel('ble_plugin');

  /// Starts BLE scan in native code
  static Future<String> startScan() async {
    final String result = await _channel.invokeMethod('startScan');
    return result;
  }
}