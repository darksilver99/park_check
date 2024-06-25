// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    String? orcApi,
    int? backgroudImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orcApi = orcApi,
        _backgroudImage = backgroudImage,
        super(firestoreUtilData);

  // "orc_api" field.
  String? _orcApi;
  String get orcApi => _orcApi ?? '';
  set orcApi(String? val) => _orcApi = val;

  bool hasOrcApi() => _orcApi != null;

  // "backgroudImage" field.
  int? _backgroudImage;
  int get backgroudImage => _backgroudImage ?? 0;
  set backgroudImage(int? val) => _backgroudImage = val;

  void incrementBackgroudImage(int amount) =>
      backgroudImage = backgroudImage + amount;

  bool hasBackgroudImage() => _backgroudImage != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        orcApi: data['orc_api'] as String?,
        backgroudImage: castToType<int>(data['backgroudImage']),
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orc_api': _orcApi,
        'backgroudImage': _backgroudImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orc_api': serializeParam(
          _orcApi,
          ParamType.String,
        ),
        'backgroudImage': serializeParam(
          _backgroudImage,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        orcApi: deserializeParam(
          data['orc_api'],
          ParamType.String,
          false,
        ),
        backgroudImage: deserializeParam(
          data['backgroudImage'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigDataStruct &&
        orcApi == other.orcApi &&
        backgroudImage == other.backgroudImage;
  }

  @override
  int get hashCode => const ListEquality().hash([orcApi, backgroudImage]);
}

ConfigDataStruct createConfigDataStruct({
  String? orcApi,
  int? backgroudImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      orcApi: orcApi,
      backgroudImage: backgroudImage,
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
