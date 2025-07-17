import 'package:flutter_test/flutter_test.dart';
import 'package:ble_plugin/ble_plugin.dart';
import 'package:ble_plugin/ble_plugin_platform_interface.dart';
import 'package:ble_plugin/ble_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBlePluginPlatform
    with MockPlatformInterfaceMixin
    implements BlePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BlePluginPlatform initialPlatform = BlePluginPlatform.instance;

  test('$MethodChannelBlePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBlePlugin>());
  });

  test('getPlatformVersion', () async {
    BlePlugin blePlugin = BlePlugin();
    MockBlePluginPlatform fakePlatform = MockBlePluginPlatform();
    BlePluginPlatform.instance = fakePlatform;

    expect(await blePlugin.getPlatformVersion(), '42');
  });
}
