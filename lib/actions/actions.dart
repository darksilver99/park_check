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
    paymentAlertDefaultText: configResult?.paymentAlertDefaultText,
    paymentDetailDefaultImage: configResult?.paymentDetailDefaultImage,
    defaultTextInLastSlip: configResult?.defaultTextInLastSlip,
    defaultMoreDetailField: configResult?.defaultMoreDetailField,
    defaultMoreImageField: configResult?.defaultMoreImageField,
    defaultMaxMoreImage: configResult?.defaultMaxMoreImage,
    guideImagePath: configResult?.guideImagePath,
    promotionDefaultImage: configResult?.promotionDefaultImage,
    helpSubjectList: configResult?.helpSubjectList,
  );
}

Future createProjectData(
  BuildContext context, {
  required ProjectListRecord? projectData,
}) async {
  FFAppState().projectData = ProjectDataStruct(
    projectDocID: projectData?.reference.id,
    projectName: projectData?.name,
    projectStampList: projectData?.stampList,
    projectObjectiveList: projectData?.objectiveList,
    projectCarList: projectData?.carList,
    projectType: projectData?.projectType,
    stampField: projectData?.stampField,
    projectReference: projectData?.reference,
    enableContactAddress: projectData?.enableContactAddress,
    logo: projectData?.logo,
    backgroundImage: projectData?.backgroundImage,
    expireDate: projectData?.expireDate,
    paymentDetailImage: projectData?.paymentDetailImage,
    paymentAlertText: projectData?.paymentAlertText,
    enableMoreImage: projectData?.enableMoreImage,
    enableMoreDetail: projectData?.enableMoreDetail,
    moreDetailField: projectData?.moreDetailField,
    moreImageField: projectData?.moreImageField,
    textInLastSlip: projectData?.textInLastSlip,
    maxMoreImage: projectData?.maxMoreImage,
    promotionImage: projectData?.promotionImage,
    helpSubjectList: projectData?.helpSubjectList,
  );
}
