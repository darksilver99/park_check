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

  // "background_image" field.
  int? _backgroundImage;
  int get backgroundImage => _backgroundImage ?? 0;
  bool hasBackgroundImage() => _backgroundImage != null;

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

  void _initializeFields() {
    _backgroundImage = castToType<int>(snapshotData['background_image']);
    _ocrApi = snapshotData['ocr_api'] as String?;
    _defaultStampList = getDataList(snapshotData['default_stamp_list']);
    _defaultCarList = getDataList(snapshotData['default_car_list']);
    _projectType = getDataList(snapshotData['project_type']);
    _defaultStampField = snapshotData['default_stamp_field'] as String?;
    _defaultObjectiveList = getDataList(snapshotData['default_objective_list']);
    _ocrAlertText = getDataList(snapshotData['ocr_alert_text']);
    _ocrErrorText = getDataList(snapshotData['ocr_error_text']);
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
  int? backgroundImage,
  String? ocrApi,
  String? defaultStampField,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'background_image': backgroundImage,
      'ocr_api': ocrApi,
      'default_stamp_field': defaultStampField,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    const listEquality = ListEquality();
    return e1?.backgroundImage == e2?.backgroundImage &&
        e1?.ocrApi == e2?.ocrApi &&
        listEquality.equals(e1?.defaultStampList, e2?.defaultStampList) &&
        listEquality.equals(e1?.defaultCarList, e2?.defaultCarList) &&
        listEquality.equals(e1?.projectType, e2?.projectType) &&
        e1?.defaultStampField == e2?.defaultStampField &&
        listEquality.equals(
            e1?.defaultObjectiveList, e2?.defaultObjectiveList) &&
        listEquality.equals(e1?.ocrAlertText, e2?.ocrAlertText) &&
        listEquality.equals(e1?.ocrErrorText, e2?.ocrErrorText);
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality().hash([
        e?.backgroundImage,
        e?.ocrApi,
        e?.defaultStampList,
        e?.defaultCarList,
        e?.projectType,
        e?.defaultStampField,
        e?.defaultObjectiveList,
        e?.ocrAlertText,
        e?.ocrErrorText
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
