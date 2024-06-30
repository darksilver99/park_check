// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrintStatusDataStruct extends FFFirebaseStruct {
  PrintStatusDataStruct({
    int? status,
    String? msg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _msg = msg,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  static PrintStatusDataStruct fromMap(Map<String, dynamic> data) =>
      PrintStatusDataStruct(
        status: castToType<int>(data['status']),
        msg: data['msg'] as String?,
      );

  static PrintStatusDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PrintStatusDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'msg': _msg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrintStatusDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrintStatusDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PrintStatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrintStatusDataStruct &&
        status == other.status &&
        msg == other.msg;
  }

  @override
  int get hashCode => const ListEquality().hash([status, msg]);
}

PrintStatusDataStruct createPrintStatusDataStruct({
  int? status,
  String? msg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrintStatusDataStruct(
      status: status,
      msg: msg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrintStatusDataStruct? updatePrintStatusDataStruct(
  PrintStatusDataStruct? printStatusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    printStatusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrintStatusDataStructData(
  Map<String, dynamic> firestoreData,
  PrintStatusDataStruct? printStatusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (printStatusData == null) {
    return;
  }
  if (printStatusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && printStatusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final printStatusDataData =
      getPrintStatusDataFirestoreData(printStatusData, forFieldValue);
  final nestedData =
      printStatusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = printStatusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrintStatusDataFirestoreData(
  PrintStatusDataStruct? printStatusData, [
  bool forFieldValue = false,
]) {
  if (printStatusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(printStatusData.toMap());

  // Add any Firestore field values
  printStatusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrintStatusDataListFirestoreData(
  List<PrintStatusDataStruct>? printStatusDatas,
) =>
    printStatusDatas
        ?.map((e) => getPrintStatusDataFirestoreData(e, true))
        .toList() ??
    [];
