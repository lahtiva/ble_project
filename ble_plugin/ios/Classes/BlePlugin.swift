import Flutter
import UIKit
import CoreBluetooth

public class SwiftBleBackgroundPlugin: NSObject, FlutterPlugin, CBCentralManagerDelegate {
  var centralManager: CBCentralManager!
  var channel: FlutterMethodChannel?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ble_background_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftBleBackgroundPlugin()
    instance.channel = channel
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "startScan" {
      centralManager = CBCentralManager(delegate: self, queue: nil)
      result("Scanning started")
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  public func centralManagerDidUpdateState(_ central: CBCentralManager) {
    if central.state == .poweredOn {
      centralManager.scanForPeripherals(withServices: nil, options: nil)
      print("iOS BLE Scan Started")
    }
  }
}