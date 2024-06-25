// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectDataStruct extends FFFirebaseStruct {
  ProjectDataStruct({
    String? projectDocID,
    String? projectName,
    List<String>? projectStampList,
    List<String>? projectObjectiveList,
    List<String>? projectCarList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectDocID = projectDocID,
        _projectName = projectName,
        _projectStampList = projectStampList,
        _projectObjectiveList = projectObjectiveList,
        _projectCarList = projectCarList,
        super(firestoreUtilData);

  // "projectDocID" field.
  String? _projectDocID;
  String get projectDocID => _projectDocID ?? '';
  set projectDocID(String? val) => _projectDocID = val;

  bool hasProjectDocID() => _projectDocID != null;

  // "projectName" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "projectStampList" field.
  List<String>? _projectStampList;
  List<String> get projectStampList => _projectStampList ?? const [];
  set projectStampList(List<String>? val) => _projectStampList = val;

  void updateProjectStampList(Function(List<String>) updateFn) {
    updateFn(projectStampList ??= []);
  }

  bool hasProjectStampList() => _projectStampList != null;

  // "projectObjectiveList" field.
  List<String>? _projectObjectiveList;
  List<String> get projectObjectiveList => _projectObjectiveList ?? const [];
  set projectObjectiveList(List<String>? val) => _projectObjectiveList = val;

  void updateProjectObjectiveList(Function(List<String>) updateFn) {
    updateFn(projectObjectiveList ??= []);
  }

  bool hasProjectObjectiveList() => _projectObjectiveList != null;

  // "projectCarList" field.
  List<String>? _projectCarList;
  List<String> get projectCarList => _projectCarList ?? const [];
  set projectCarList(List<String>? val) => _projectCarList = val;

  void updateProjectCarList(Function(List<String>) updateFn) {
    updateFn(projectCarList ??= []);
  }

  bool hasProjectCarList() => _projectCarList != null;

  static ProjectDataStruct fromMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        projectDocID: data['projectDocID'] as String?,
        projectName: data['projectName'] as String?,
        projectStampList: getDataList(data['projectStampList']),
        projectObjectiveList: getDataList(data['projectObjectiveList']),
        projectCarList: getDataList(data['projectCarList']),
      );

  static ProjectDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'projectDocID': _projectDocID,
        'projectName': _projectName,
        'projectStampList': _projectStampList,
        'projectObjectiveList': _projectObjectiveList,
        'projectCarList': _projectCarList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'projectDocID': serializeParam(
          _projectDocID,
          ParamType.String,
        ),
        'projectName': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'projectStampList': serializeParam(
          _projectStampList,
          ParamType.String,
          isList: true,
        ),
        'projectObjectiveList': serializeParam(
          _projectObjectiveList,
          ParamType.String,
          isList: true,
        ),
        'projectCarList': serializeParam(
          _projectCarList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ProjectDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        projectDocID: deserializeParam(
          data['projectDocID'],
          ParamType.String,
          false,
        ),
        projectName: deserializeParam(
          data['projectName'],
          ParamType.String,
          false,
        ),
        projectStampList: deserializeParam<String>(
          data['projectStampList'],
          ParamType.String,
          true,
        ),
        projectObjectiveList: deserializeParam<String>(
          data['projectObjectiveList'],
          ParamType.String,
          true,
        ),
        projectCarList: deserializeParam<String>(
          data['projectCarList'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ProjectDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProjectDataStruct &&
        projectDocID == other.projectDocID &&
        projectName == other.projectName &&
        listEquality.equals(projectStampList, other.projectStampList) &&
        listEquality.equals(projectObjectiveList, other.projectObjectiveList) &&
        listEquality.equals(projectCarList, other.projectCarList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        projectDocID,
        projectName,
        projectStampList,
        projectObjectiveList,
        projectCarList
      ]);
}

ProjectDataStruct createProjectDataStruct({
  String? projectDocID,
  String? projectName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectDataStruct(
      projectDocID: projectDocID,
      projectName: projectName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectDataStruct? updateProjectDataStruct(
  ProjectDataStruct? projectData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectDataStructData(
  Map<String, dynamic> firestoreData,
  ProjectDataStruct? projectData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectData == null) {
    return;
  }
  if (projectData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectDataData =
      getProjectDataFirestoreData(projectData, forFieldValue);
  final nestedData =
      projectDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectDataFirestoreData(
  ProjectDataStruct? projectData, [
  bool forFieldValue = false,
]) {
  if (projectData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectData.toMap());

  // Add any Firestore field values
  projectData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectDataListFirestoreData(
  List<ProjectDataStruct>? projectDatas,
) =>
    projectDatas?.map((e) => getProjectDataFirestoreData(e, true)).toList() ??
    [];
