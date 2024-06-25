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

DateTime getStartDayTime() {
  DateTime now = DateTime.now();
  DateTime startOfDay = DateTime(now.year, now.month, now.day);
  return startOfDay;
}

DateTime getEndDayTime() {
  DateTime now = DateTime.now();
  DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 0, 0);
  return endOfDay;
}

String getTimeDuration(
  DateTime dateIn,
  DateTime dateOut,
) {
  Duration duration = dateOut.difference(dateIn);

  double totalHours =
      duration.inHours.toDouble() + (duration.inMinutes.remainder(60) / 60);

  // Check if the duration is more than a day
  if (totalHours >= 24) {
    // Calculate days and remaining hours
    int days = duration.inDays;
    double remainingHours = totalHours - (days * 24);
    return '${days} วัน${days > 1 ? 's' : ''} ${remainingHours.toStringAsFixed(2)} ชม.';
  } else {
    return '${totalHours.toStringAsFixed(2)} ชม.';
  }
}
