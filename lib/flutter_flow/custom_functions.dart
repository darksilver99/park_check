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
  return phoneNumber;
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

  // Calculate the days, hours, minutes, and seconds
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  // Construct the formatted string based on the duration
  StringBuffer result = StringBuffer();

  if (days > 0) {
    result.write('$days วัน ');
  }

  if (hours > 0 || days > 0) {
    // Only show hours if there are any days or hours
    result.write('$hours ชม. ');
  }

  if (minutes > 0 || hours > 0 || days > 0) {
    // Only show minutes if there are any days, hours, or minutes
    result.write('$minutes นาที ');
  }

  result.write('$seconds วินาที');

  return result.toString().trim(); // Trim any trailing spaces
}

List<TransactionListRecord> updateTransactionList(
  List<TransactionListRecord> transactionList,
  String keyword,
  bool isOnlyNotOut,
) {
  List<TransactionListRecord> transactionSearchedList =
      transactionList.where((doc) {
    if (isOnlyNotOut) {
      print("aaa");
      return (doc.carRegistration.contains(keyword) ||
              doc.firstName.contains(keyword)) &&
          !doc.isOut;
    } else {
      print("bbb");
      return doc.carRegistration.contains(keyword) ||
          doc.firstName.contains(keyword);
    }
  }).toList();
  return transactionSearchedList;
}

String dateTimeTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String dateTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

DocumentReference configReference() {
  return FirebaseFirestore.instance.doc("config/park_car_app");
}

DateTime getNextDay(int nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay));
  return futureDate;
}
