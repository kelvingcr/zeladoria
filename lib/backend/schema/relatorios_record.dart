import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelatoriosRecord extends FirestoreRecord {
  RelatoriosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "rastreadorRef" field.
  DocumentReference? _rastreadorRef;
  DocumentReference? get rastreadorRef => _rastreadorRef;
  bool hasRastreadorRef() => _rastreadorRef != null;

  // "ambienteRef" field.
  DocumentReference? _ambienteRef;
  DocumentReference? get ambienteRef => _ambienteRef;
  bool hasAmbienteRef() => _ambienteRef != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comentario = snapshotData['comentario'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _rastreadorRef = snapshotData['rastreadorRef'] as DocumentReference?;
    _ambienteRef = snapshotData['ambienteRef'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('relatorios')
          : FirebaseFirestore.instance.collectionGroup('relatorios');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('relatorios').doc();

  static Stream<RelatoriosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelatoriosRecord.fromSnapshot(s));

  static Future<RelatoriosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelatoriosRecord.fromSnapshot(s));

  static RelatoriosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelatoriosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelatoriosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelatoriosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelatoriosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelatoriosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelatoriosRecordData({
  String? comentario,
  DateTime? data,
  DocumentReference? userRef,
  DocumentReference? rastreadorRef,
  DocumentReference? ambienteRef,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comentario': comentario,
      'data': data,
      'userRef': userRef,
      'rastreadorRef': rastreadorRef,
      'ambienteRef': ambienteRef,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelatoriosRecordDocumentEquality implements Equality<RelatoriosRecord> {
  const RelatoriosRecordDocumentEquality();

  @override
  bool equals(RelatoriosRecord? e1, RelatoriosRecord? e2) {
    return e1?.comentario == e2?.comentario &&
        e1?.data == e2?.data &&
        e1?.userRef == e2?.userRef &&
        e1?.rastreadorRef == e2?.rastreadorRef &&
        e1?.ambienteRef == e2?.ambienteRef &&
        e1?.status == e2?.status;
  }

  @override
  int hash(RelatoriosRecord? e) => const ListEquality().hash([
        e?.comentario,
        e?.data,
        e?.userRef,
        e?.rastreadorRef,
        e?.ambienteRef,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is RelatoriosRecord;
}
