import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String convertPhoneNumber(String phoneNumber) {
  if (phoneNumber.startsWith('0')) {
    return '+66' + phoneNumber.substring(1);
  }
  return phoneNumber; // Return as is if it doesn't start with '0'
}

DateTime getStartDayTime(DateTime currentDate) {
  DateTime startOfDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  return startOfDay;
}

DateTime getEndDayTime(DateTime currentDate) {
  DateTime endOfDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day, 23, 0, 0);
  return endOfDay;
}

String getTimeDuration(
  DateTime dateIn,
  DateTime dateOut,
) {
  // Calculate the duration between the two dates
  Duration duration = dateOut.difference(dateIn);

  // Calculate the days, hours, and minutes
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);

  // Construct the formatted string based on the duration
  StringBuffer result = StringBuffer();

  if (days > 0) {
    result.write('$days วัน ');
  }

  if (hours > 0 || days > 0) {
    // Only show hours if there are any days or hours
    result.write('$hours ชม. ');
  }

  result.write('$minutes นาที');

  return result.toString().trim(); // Trim any trailing spaces
}

List<TransactionListRecord> updateTransactionList(
  List<TransactionListRecord> transactionList,
  String keyword,
  bool isOut,
) {
  return transactionList.where((transaction) => transaction.isOut).toList();
}
