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

import 'package:image/image.dart' as ui;

Future<dynamic> addWaterMark(
  dynamic baseImage,
  dynamic waterMarkImage,
) async {
  // Add your function code here!

  ui.Image? originalImage = ui.decodeImage(image1);
  ui.Image? watermarkImage = ui.decodeImage(image2);
  watermarkImage = ui.copyResize(watermarkImage!, width: originalImage!.width);

  final mergedImage =
      ui.Image(width: originalImage.width, height: originalImage.height);

  ui.compositeImage(originalImage, watermarkImage, center: true);
  ui.compositeImage(mergedImage, originalImage);

  List<int> wmImage = ui.encodePng(mergedImage);
  Uint8List encodeImg = Uint8List.fromList(wmImage);

  return encodeImg;
}
