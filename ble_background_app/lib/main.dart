import 'package:flutter/material.dart';
import 'package:ble_plugin/ble_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = 'Unknown';

  @override
  void initState() {
    super.initState();

    [Permission.bluetooth, Permission.bluetoothScan, Permission.bluetoothConnect, Permission.location, Permission.notification].request();

  }

  void _startBle() async {
    final status = await BlePlugin.startScan();
    setState(() { _status = status; });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BLE Scan')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Scan status: $_status'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startBle,
                child: Text('Start BLE Scan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}