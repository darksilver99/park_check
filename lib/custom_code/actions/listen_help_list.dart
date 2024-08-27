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

Future listenHelpList() async {
  // Add your function code here!
  print("listenHelpList");
  FirebaseFirestore.instance
      .collection(
          "${FFAppState().projectData.projectReference!.path}/help_list")
      .where("status", isEqualTo: 0)
      .snapshots()
      .listen((data) {
    print(data.size);
    if (data.size > 0) {
      FFAppState().isHasHelp = true;
    } else {
      FFAppState().isHasHelp = false;
    }
    FFAppState().update(() {});
  });
}
