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
    String? defaultStampField,
    List<String>? defaultCarList,
    List<String>? defaultStampList,
    List<String>? defaultObjectiveList,
    List<String>? projectType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _backgroudImage = backgroudImage,
        _ocrApi = ocrApi,
        _defaultStampField = defaultStampField,
        _defaultCarList = defaultCarList,
        _defaultStampList = defaultStampList,
        _defaultObjectiveList = defaultObjectiveList,
        _projectType = projectType,
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

  // "default_stamp_field" field.
  String? _defaultStampField;
  String get defaultStampField => _defaultStampField ?? '';
  set defaultStampField(String? val) => _defaultStampField = val;

  bool hasDefaultStampField() => _defaultStampField != null;

  // "default_car_list" field.
  List<String>? _defaultCarList;
  List<String> get defaultCarList => _defaultCarList ?? const [];
  set defaultCarList(List<String>? val) => _defaultCarList = val;

  void updateDefaultCarList(Function(List<String>) updateFn) {
    updateFn(_defaultCarList ??= []);
  }

  bool hasDefaultCarList() => _defaultCarList != null;

  // "default_stamp_list" field.
  List<String>? _defaultStampList;
  List<String> get defaultStampList => _defaultStampList ?? const [];
  set defaultStampList(List<String>? val) => _defaultStampList = val;

  void updateDefaultStampList(Function(List<String>) updateFn) {
    updateFn(_defaultStampList ??= []);
  }

  bool hasDefaultStampList() => _defaultStampList != null;

  // "default_objective_list" field.
  List<String>? _defaultObjectiveList;
  List<String> get defaultObjectiveList => _defaultObjectiveList ?? const [];
  set defaultObjectiveList(List<String>? val) => _defaultObjectiveList = val;

  void updateDefaultObjectiveList(Function(List<String>) updateFn) {
    updateFn(_defaultObjectiveList ??= []);
  }

  bool hasDefaultObjectiveList() => _defaultObjectiveList != null;

  // "project_type" field.
  List<String>? _projectType;
  List<String> get projectType => _projectType ?? const [];
  set projectType(List<String>? val) => _projectType = val;

  void updateProjectType(Function(List<String>) updateFn) {
    updateFn(_projectType ??= []);
  }

  bool hasProjectType() => _projectType != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        backgroudImage: castToType<int>(data['backgroudImage']),
        ocrApi: data['ocr_api'] as String?,
        defaultStampField: data['default_stamp_field'] as String?,
        defaultCarList: getDataList(data['default_car_list']),
        defaultStampList: getDataList(data['default_stamp_list']),
        defaultObjectiveList: getDataList(data['default_objective_list']),
        projectType: getDataList(data['project_type']),
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'backgroudImage': _backgroudImage,
        'ocr_api': _ocrApi,
        'default_stamp_field': _defaultStampField,
        'default_car_list': _defaultCarList,
        'default_stamp_list': _defaultStampList,
        'default_objective_list': _defaultObjectiveList,
        'project_type': _projectType,
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
        'default_stamp_field': serializeParam(
          _defaultStampField,
          ParamType.String,
        ),
        'default_car_list': serializeParam(
          _defaultCarList,
          ParamType.String,
          isList: true,
        ),
        'default_stamp_list': serializeParam(
          _defaultStampList,
          ParamType.String,
          isList: true,
        ),
        'default_objective_list': serializeParam(
          _defaultObjectiveList,
          ParamType.String,
          isList: true,
        ),
        'project_type': serializeParam(
          _projectType,
          ParamType.String,
          isList: true,
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
        defaultStampField: deserializeParam(
          data['default_stamp_field'],
          ParamType.String,
          false,
        ),
        defaultCarList: deserializeParam<String>(
          data['default_car_list'],
          ParamType.String,
          true,
        ),
        defaultStampList: deserializeParam<String>(
          data['default_stamp_list'],
          ParamType.String,
          true,
        ),
        defaultObjectiveList: deserializeParam<String>(
          data['default_objective_list'],
          ParamType.String,
          true,
        ),
        projectType: deserializeParam<String>(
          data['project_type'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        backgroudImage == other.backgroudImage &&
        ocrApi == other.ocrApi &&
        defaultStampField == other.defaultStampField &&
        listEquality.equals(defaultCarList, other.defaultCarList) &&
        listEquality.equals(defaultStampList, other.defaultStampList) &&
        listEquality.equals(defaultObjectiveList, other.defaultObjectiveList) &&
        listEquality.equals(projectType, other.projectType);
  }

  @override
  int get hashCode => const ListEquality().hash([
        backgroudImage,
        ocrApi,
        defaultStampField,
        defaultCarList,
        defaultStampList,
        defaultObjectiveList,
        projectType
      ]);
}

ConfigDataStruct createConfigDataStruct({
  int? backgroudImage,
  String? ocrApi,
  String? defaultStampField,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      backgroudImage: backgroudImage,
      ocrApi: ocrApi,
      defaultStampField: defaultStampField,
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
