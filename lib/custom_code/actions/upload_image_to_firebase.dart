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

import 'package:park_check/backend/firebase_storage/storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<String> uploadImageToFirebase(
  FFUploadedFile image,
  String type,
) async {
  // Add your function code here!
  String path =
      'transaction/${FFAppState().projectData.projectDocID}/$type/${image.name}';

  Uint8List compress = await FlutterImageCompress.compressWithList(
    image.bytes!,
    minWidth: 300,
    quality: 50,
  );

  var url = await uploadData(path, compress);
  return url ?? '';
}
