import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ble_plugin_platform_interface.dart';

/// An implementation of [BlePluginPlatform] that uses method channels.
class MethodChannelBlePlugin extends BlePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ble_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
