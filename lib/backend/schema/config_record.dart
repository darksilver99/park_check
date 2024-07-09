import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ocr_api" field.
  String? _ocrApi;
  String get ocrApi => _ocrApi ?? '';
  bool hasOcrApi() => _ocrApi != null;

  // "default_stamp_list" field.
  List<String>? _defaultStampList;
  List<String> get defaultStampList => _defaultStampList ?? const [];
  bool hasDefaultStampList() => _defaultStampList != null;

  // "default_car_list" field.
  List<String>? _defaultCarList;
  List<String> get defaultCarList => _defaultCarList ?? const [];
  bool hasDefaultCarList() => _defaultCarList != null;

  // "project_type" field.
  List<String>? _projectType;
  List<String> get projectType => _projectType ?? const [];
  bool hasProjectType() => _projectType != null;

  // "default_stamp_field" field.
  String? _defaultStampField;
  String get defaultStampField => _defaultStampField ?? '';
  bool hasDefaultStampField() => _defaultStampField != null;

  // "default_objective_list" field.
  List<String>? _defaultObjectiveList;
  List<String> get defaultObjectiveList => _defaultObjectiveList ?? const [];
  bool hasDefaultObjectiveList() => _defaultObjectiveList != null;

  // "ocr_alert_text" field.
  List<String>? _ocrAlertText;
  List<String> get ocrAlertText => _ocrAlertText ?? const [];
  bool hasOcrAlertText() => _ocrAlertText != null;

  // "ocr_error_text" field.
  List<String>? _ocrErrorText;
  List<String> get ocrErrorText => _ocrErrorText ?? const [];
  bool hasOcrErrorText() => _ocrErrorText != null;

  // "province_list" field.
  List<String>? _provinceList;
  List<String> get provinceList => _provinceList ?? const [];
  bool hasProvinceList() => _provinceList != null;

  // "default_background_image" field.
  int? _defaultBackgroundImage;
  int get defaultBackgroundImage => _defaultBackgroundImage ?? 0;
  bool hasDefaultBackgroundImage() => _defaultBackgroundImage != null;

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  bool hasPolicyUrl() => _policyUrl != null;

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  bool hasStoreVersion() => _storeVersion != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  bool hasStoreIosLink() => _storeIosLink != null;

  // "payment_alert_default_text" field.
  List<String>? _paymentAlertDefaultText;
  List<String> get paymentAlertDefaultText =>
      _paymentAlertDefaultText ?? const [];
  bool hasPaymentAlertDefaultText() => _paymentAlertDefaultText != null;

  // "payment_detail_default_image" field.
  String? _paymentDetailDefaultImage;
  String get paymentDetailDefaultImage => _paymentDetailDefaultImage ?? '';
  bool hasPaymentDetailDefaultImage() => _paymentDetailDefaultImage != null;

  // "default_text_in_last_slip" field.
  String? _defaultTextInLastSlip;
  String get defaultTextInLastSlip => _defaultTextInLastSlip ?? '';
  bool hasDefaultTextInLastSlip() => _defaultTextInLastSlip != null;

  // "default_more_image_field" field.
  String? _defaultMoreImageField;
  String get defaultMoreImageField => _defaultMoreImageField ?? '';
  bool hasDefaultMoreImageField() => _defaultMoreImageField != null;

  // "default_more_detail_field" field.
  String? _defaultMoreDetailField;
  String get defaultMoreDetailField => _defaultMoreDetailField ?? '';
  bool hasDefaultMoreDetailField() => _defaultMoreDetailField != null;

  // "default_max_more_image" field.
  int? _defaultMaxMoreImage;
  int get defaultMaxMoreImage => _defaultMaxMoreImage ?? 0;
  bool hasDefaultMaxMoreImage() => _defaultMaxMoreImage != null;

  // "guide_image_path" field.
  String? _guideImagePath;
  String get guideImagePath => _guideImagePath ?? '';
  bool hasGuideImagePath() => _guideImagePath != null;

  // "promotion_default_image" field.
  String? _promotionDefaultImage;
  String get promotionDefaultImage => _promotionDefaultImage ?? '';
  bool hasPromotionDefaultImage() => _promotionDefaultImage != null;

  void _initializeFields() {
    _ocrApi = snapshotData['ocr_api'] as String?;
    _defaultStampList = getDataList(snapshotData['default_stamp_list']);
    _defaultCarList = getDataList(snapshotData['default_car_list']);
    _projectType = getDataList(snapshotData['project_type']);
    _defaultStampField = snapshotData['default_stamp_field'] as String?;
    _defaultObjectiveList = getDataList(snapshotData['default_objective_list']);
    _ocrAlertText = getDataList(snapshotData['ocr_alert_text']);
    _ocrErrorText = getDataList(snapshotData['ocr_error_text']);
    _provinceList = getDataList(snapshotData['province_list']);
    _defaultBackgroundImage =
        castToType<int>(snapshotData['default_background_image']);
    _policyUrl = snapshotData['policy_url'] as String?;
    _storeVersion = castToType<int>(snapshotData['store_version']);
    _storeAndroidLink = snapshotData['store_android_link'] as String?;
    _storeIosLink = snapshotData['store_ios_link'] as String?;
    _paymentAlertDefaultText =
        getDataList(snapshotData['payment_alert_default_text']);
    _paymentDetailDefaultImage =
        snapshotData['payment_detail_default_image'] as String?;
    _defaultTextInLastSlip =
        snapshotData['default_text_in_last_slip'] as String?;
    _defaultMoreImageField =
        snapshotData['default_more_image_field'] as String?;
    _defaultMoreDetailField =
        snapshotData['default_more_detail_field'] as String?;
    _defaultMaxMoreImage =
        castToType<int>(snapshotData['default_max_more_image']);
    _guideImagePath = snapshotData['guide_image_path'] as String?;
    _promotionDefaultImage = snapshotData['promotion_default_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  String? ocrApi,
  String? defaultStampField,
  int? defaultBackgroundImage,
  String? policyUrl,
  int? storeVersion,
  String? storeAndroidLink,
  String? storeIosLink,
  String? paymentDetailDefaultImage,
  String? defaultTextInLastSlip,
  String? defaultMoreImageField,
  String? defaultMoreDetailField,
  int? defaultMaxMoreImage,
  String? guideImagePath,
  String? promotionDefaultImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ocr_api': ocrApi,
      'default_stamp_field': defaultStampField,
      'default_background_image': defaultBackgroundImage,
      'policy_url': policyUrl,
      'store_version': storeVersion,
      'store_android_link': storeAndroidLink,
      'store_ios_link': storeIosLink,
      'payment_detail_default_image': paymentDetailDefaultImage,
      'default_text_in_last_slip': defaultTextInLastSlip,
      'default_more_image_field': defaultMoreImageField,
      'default_more_detail_field': defaultMoreDetailField,
      'default_max_more_image': defaultMaxMoreImage,
      'guide_image_path': guideImagePath,
      'promotion_default_image': promotionDefaultImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ocrApi == e2?.ocrApi &&
        listEquality.equals(e1?.defaultStampList, e2?.defaultStampList) &&
        listEquality.equals(e1?.defaultCarList, e2?.defaultCarList) &&
        listEquality.equals(e1?.projectType, e2?.projectType) &&
        e1?.defaultStampField == e2?.defaultStampField &&
        listEquality.equals(
            e1?.defaultObjectiveList, e2?.defaultObjectiveList) &&
        listEquality.equals(e1?.ocrAlertText, e2?.ocrAlertText) &&
        listEquality.equals(e1?.ocrErrorText, e2?.ocrErrorText) &&
        listEquality.equals(e1?.provinceList, e2?.provinceList) &&
        e1?.defaultBackgroundImage == e2?.defaultBackgroundImage &&
        e1?.policyUrl == e2?.policyUrl &&
        e1?.storeVersion == e2?.storeVersion &&
        e1?.storeAndroidLink == e2?.storeAndroidLink &&
        e1?.storeIosLink == e2?.storeIosLink &&
        listEquality.equals(
            e1?.paymentAlertDefaultText, e2?.paymentAlertDefaultText) &&
        e1?.paymentDetailDefaultImage == e2?.paymentDetailDefaultImage &&
        e1?.defaultTextInLastSlip == e2?.defaultTextInLastSlip &&
        e1?.defaultMoreImageField == e2?.defaultMoreImageField &&
        e1?.defaultMoreDetailField == e2?.defaultMoreDetailField &&
        e1?.defaultMaxMoreImage == e2?.defaultMaxMoreImage &&
        e1?.guideImagePath == e2?.guideImagePath &&
        e1?.promotionDefaultImage == e2?.promotionDefaultImage;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality().hash([
        e?.ocrApi,
        e?.defaultStampList,
        e?.defaultCarList,
        e?.projectType,
        e?.defaultStampField,
        e?.defaultObjectiveList,
        e?.ocrAlertText,
        e?.ocrErrorText,
        e?.provinceList,
        e?.defaultBackgroundImage,
        e?.policyUrl,
        e?.storeVersion,
        e?.storeAndroidLink,
        e?.storeIosLink,
        e?.paymentAlertDefaultText,
        e?.paymentDetailDefaultImage,
        e?.defaultTextInLastSlip,
        e?.defaultMoreImageField,
        e?.defaultMoreDetailField,
        e?.defaultMaxMoreImage,
        e?.guideImagePath,
        e?.promotionDefaultImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
