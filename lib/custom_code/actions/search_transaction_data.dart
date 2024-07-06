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

import '/flutter_flow/custom_functions.dart' as functions;

Future<List<TransactionListRecord>> searchTransactionData(
  String keyword,
  DateTime startDate,
  DateTime endDate,
  bool isHistory,
) async {
  // Add your function code here!
  QuerySnapshot<Map<String, dynamic>> rs;
  if (isHistory) {
    rs = await FirebaseFirestore.instance
        .collection(
            'project_list/${FFAppState().projectData.projectDocID}/transaction_list')
        .where("date_in",
            isGreaterThanOrEqualTo: functions.getStartDayTime(startDate))
        .where("date_in", isLessThanOrEqualTo: functions.getEndDayTime(endDate))
        .orderBy("date_in", descending: true)
        .get();
  } else {
    rs = await FirebaseFirestore.instance
        .collection(
            'project_list/${FFAppState().projectData.projectDocID}/transaction_list')
        .where("date_in",
            isGreaterThanOrEqualTo: functions.getStartDayTime(startDate))
        .where("date_in", isLessThanOrEqualTo: functions.getEndDayTime(endDate))
        .where("is_out", isEqualTo: false)
        .orderBy("date_in", descending: true)
        .get();
  }

  List<TransactionListRecord> transactionList = rs.docs.where((doc) {
    String carRegistration = doc['car_registration'] ?? '';
    String firstName = doc['first_name'] ?? '';
    return carRegistration.contains(keyword) || firstName.contains(keyword);
  }).map((filteredDoc) {
    return TransactionListRecord.fromSnapshot(filteredDoc);
  }).toList();
  return transactionList;
}
