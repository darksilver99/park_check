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

  // "orc_api" field.
  String? _orcApi;
  String get orcApi => _orcApi ?? '';
  bool hasOrcApi() => _orcApi != null;

  // "background_image" field.
  int? _backgroundImage;
  int get backgroundImage => _backgroundImage ?? 0;
  bool hasBackgroundImage() => _backgroundImage != null;

  void _initializeFields() {
    _orcApi = snapshotData['orc_api'] as String?;
    _backgroundImage = castToType<int>(snapshotData['background_image']);
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
  String? orcApi,
  int? backgroundImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orc_api': orcApi,
      'background_image': backgroundImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.orcApi == e2?.orcApi &&
        e1?.backgroundImage == e2?.backgroundImage;
  }

  @override
  int hash(ConfigRecord? e) =>
      const ListEquality().hash([e?.orcApi, e?.backgroundImage]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
