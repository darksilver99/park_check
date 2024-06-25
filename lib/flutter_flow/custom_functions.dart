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

  // Create a new DateTime object with the time set to 23:00:00
  DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 0, 0);
  return endOfDay;
}
