// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<TransactionListRecord>> searchTransactionData(
    String keyword) async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance
      .collection(
          'project_list/${FFAppState().projectData.projectDocID}/transaction_list')
      .where("")
      .where('car_registration', isGreaterThanOrEqualTo: keyword)
      .where('car_registration', isLessThanOrEqualTo: '$keyword\uf8ff')
      .get();
  List<TransactionListRecord> transactionList = rs.docs.map((doc) {
    return TransactionListRecord.fromSnapshot(doc);
  }).toList();
  return transactionList;
}
