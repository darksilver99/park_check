// Automatic FlutterFlow imports
import 'package:permission_handler/permission_handler.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> getPrinterList() async {
  // Add your function code here!

  print("getPrinterList");

  if (await Permission.bluetooth.isGranted &&
      await Permission.bluetoothConnect.isGranted &&
      await Permission.bluetoothScan.isGranted &&
      await Permission.location.isGranted) {
    // Permissions are already granted, proceed with Bluetooth operations
    print("aaa");
  } else {
    // Request the necessary permissions
    print("bbb");
    await [
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location,
    ].request();
  }

  return [
    {"aaa": "aaa"}
  ];
}
