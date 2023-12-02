import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RastreadoresRecord extends FirestoreRecord {
  RastreadoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rastreadores')
          : FirebaseFirestore.instance.collectionGroup('rastreadores');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('rastreadores').doc();

  static Stream<RastreadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RastreadoresRecord.fromSnapshot(s));

  static Future<RastreadoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RastreadoresRecord.fromSnapshot(s));

  static RastreadoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RastreadoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RastreadoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RastreadoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RastreadoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RastreadoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRastreadoresRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class RastreadoresRecordDocumentEquality
    implements Equality<RastreadoresRecord> {
  const RastreadoresRecordDocumentEquality();

  @override
  bool equals(RastreadoresRecord? e1, RastreadoresRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(RastreadoresRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is RastreadoresRecord;
}
