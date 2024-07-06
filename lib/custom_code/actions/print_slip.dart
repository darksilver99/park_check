// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:bluetooth_print/bluetooth_print.dart';

Future<PrintStatusDataStruct> printSlip(dynamic imageSlip) async {
  // Add your function code here!
  PrintStatusDataStruct data =
      PrintStatusDataStruct(status: 2, msg: "no data print");
  if (imageSlip == null) {
    return data;
  }

  BluetoothPrint bluetoothPrint = await BluetoothPrint.instance;
  bool isConnected = await bluetoothPrint.isConnected ?? false;
  print("isConnected : $isConnected");
  if (!isConnected) {
    return PrintStatusDataStruct(msg: "ยังไม่ได้เชื่อมต่อเครื่องพิมพ์");
  }

  Map<String, dynamic> config = Map();

  List<LineText> list = [];

  final bytes = await imageSlip.capture();
  String base64Image = base64Encode(bytes!.toList());
  list.add(LineText(
      type: LineText.TYPE_IMAGE,
      content: base64Image,
      align: LineText.ALIGN_CENTER,
      width: 400,
      size: 1,
      weight: 1));

  await bluetoothPrint.printReceipt(config, list);

  data = PrintStatusDataStruct(status: 1, msg: "");

  return data;
}
