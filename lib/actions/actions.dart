import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future getConfigData(BuildContext context) async {
  ConfigRecord? configResult;

  configResult =
      await ConfigRecord.getDocumentOnce(functions.configReference());
  FFAppState().configData = ConfigDataStruct(
    ocrApi: configResult?.ocrApi,
    defaultStampField: configResult?.defaultStampField,
    defaultCarList: configResult?.defaultCarList,
    defaultStampList: configResult?.defaultStampList,
    defaultObjectiveList: configResult?.defaultObjectiveList,
    projectType: configResult?.projectType,
    ocrAlertText: configResult?.ocrAlertText,
    ocrErrorText: configResult?.ocrErrorText,
    provinceList: configResult?.provinceList,
    defaultBackgroundImage: configResult?.defaultBackgroundImage,
    storeVersion: configResult?.storeVersion,
    storeAndroidLink: configResult?.storeAndroidLink,
    storeIosLink: configResult?.storeIosLink,
    guideUrl: configResult?.guideUrl,
    paymentAlertDefaultText: configResult?.paymentAlertDefaultText,
    paymentDetailDefaultImage: configResult?.paymentDetailDefaultImage,
  );
}
