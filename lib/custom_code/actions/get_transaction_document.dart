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

Future<TransactionListRecord?> getTransactionDocument(String docID) async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance
      .doc(
          'project_list/${FFAppState().projectData.projectDocID}/transaction_list/$docID')
      .get();
  return rs.exists ? TransactionListRecord.getDocumentOnce(rs.reference) : null;
}
