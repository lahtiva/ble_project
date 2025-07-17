import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ble_plugin_method_channel.dart';

abstract class BlePluginPlatform extends PlatformInterface {
  /// Constructs a BlePluginPlatform.
  BlePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BlePluginPlatform _instance = MethodChannelBlePlugin();

  /// The default instance of [BlePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBlePlugin].
  static BlePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BlePluginPlatform] when
  /// they register themselves.
  static set instance(BlePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
