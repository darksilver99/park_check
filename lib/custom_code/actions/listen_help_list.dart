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

import '/custom_code/actions/index.dart' as actions;
import 'package:just_audio/just_audio.dart';

Future listenHelpList(dynamic audioHelper) async {
  // Add your function code here!
  final audioHelper = AudioPlayer();
  FirebaseFirestore.instance
      .collection(
          "${FFAppState().projectData.projectReference!.path}/help_list")
      .where("status", isEqualTo: 0)
      .snapshots()
      .listen((data) {
    print(data.size);
    if (data.size > FFAppState().totalHelp) {
      actions.playAlertSound(audioHelper);
    }
    FFAppState().totalHelp = data.size;
    if (data.size > 0) {
      FFAppState().isHasHelp = true;
    } else {
      FFAppState().isHasHelp = false;
    }
    FFAppState().update(() {});
  });
}
