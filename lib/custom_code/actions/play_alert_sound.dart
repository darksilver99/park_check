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

Future playAlertSound(dynamic audioPlayer) async {
  // Add your function code here!
  try {
    if (audioPlayer.playing) {
      await audioPlayer.stop();
    }
    audioPlayer.setVolume(1.0);
    audioPlayer
        .setAsset('assets/audios/big-alert-136677.wav')
        .then((_) => audioPlayer.play());
  } catch (e) {
    debugPrint("Error playing sound: $e");
  }
}
