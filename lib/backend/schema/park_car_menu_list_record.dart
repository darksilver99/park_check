import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkCarMenuListRecord extends FirestoreRecord {
  ParkCarMenuListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "path_name" field.
  String? _pathName;
  String get pathName => _pathName ?? '';
  bool hasPathName() => _pathName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _seq = castToType<int>(snapshotData['seq']);
    _subject = snapshotData['subject'] as String?;
    _pathName = snapshotData['path_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('park_car_menu_list')
          : FirebaseFirestore.instance.collectionGroup('park_car_menu_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('park_car_menu_list').doc(id);

  static Stream<ParkCarMenuListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkCarMenuListRecord.fromSnapshot(s));

  static Future<ParkCarMenuListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkCarMenuListRecord.fromSnapshot(s));

  static ParkCarMenuListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkCarMenuListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkCarMenuListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkCarMenuListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkCarMenuListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkCarMenuListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkCarMenuListRecordData({
  int? status,
  int? seq,
  String? subject,
  String? pathName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'seq': seq,
      'subject': subject,
      'path_name': pathName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkCarMenuListRecordDocumentEquality
    implements Equality<ParkCarMenuListRecord> {
  const ParkCarMenuListRecordDocumentEquality();

  @override
  bool equals(ParkCarMenuListRecord? e1, ParkCarMenuListRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.seq == e2?.seq &&
        e1?.subject == e2?.subject &&
        e1?.pathName == e2?.pathName;
  }

  @override
  int hash(ParkCarMenuListRecord? e) =>
      const ListEquality().hash([e?.status, e?.seq, e?.subject, e?.pathName]);

  @override
  bool isValidKey(Object? o) => o is ParkCarMenuListRecord;
}
