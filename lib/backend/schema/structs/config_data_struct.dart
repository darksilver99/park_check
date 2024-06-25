// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    int? backgroudImage,
    String? ocrApi,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _backgroudImage = backgroudImage,
        _ocrApi = ocrApi,
        super(firestoreUtilData);

  // "backgroudImage" field.
  int? _backgroudImage;
  int get backgroudImage => _backgroudImage ?? 0;
  set backgroudImage(int? val) => _backgroudImage = val;

  void incrementBackgroudImage(int amount) =>
      backgroudImage = backgroudImage + amount;

  bool hasBackgroudImage() => _backgroudImage != null;

  // "ocr_api" field.
  String? _ocrApi;
  String get ocrApi => _ocrApi ?? '';
  set ocrApi(String? val) => _ocrApi = val;

  bool hasOcrApi() => _ocrApi != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        backgroudImage: castToType<int>(data['backgroudImage']),
        ocrApi: data['ocr_api'] as String?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'backgroudImage': _backgroudImage,
        'ocr_api': _ocrApi,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'backgroudImage': serializeParam(
          _backgroudImage,
          ParamType.int,
        ),
        'ocr_api': serializeParam(
          _ocrApi,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        backgroudImage: deserializeParam(
          data['backgroudImage'],
          ParamType.int,
          false,
        ),
        ocrApi: deserializeParam(
          data['ocr_api'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigDataStruct &&
        backgroudImage == other.backgroudImage &&
        ocrApi == other.ocrApi;
  }

  @override
  int get hashCode => const ListEquality().hash([backgroudImage, ocrApi]);
}

ConfigDataStruct createConfigDataStruct({
  int? backgroudImage,
  String? ocrApi,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      backgroudImage: backgroudImage,
      ocrApi: ocrApi,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
