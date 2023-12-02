import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmbientesRecord extends FirestoreRecord {
  AmbientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "rastreadoresList" field.
  DocumentReference? _rastreadoresList;
  DocumentReference? get rastreadoresList => _rastreadoresList;
  bool hasRastreadoresList() => _rastreadoresList != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "qrCode" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _rastreadoresList = snapshotData['rastreadoresList'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _qrCode = snapshotData['qrCode'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ambientes')
          : FirebaseFirestore.instance.collectionGroup('ambientes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ambientes').doc();

  static Stream<AmbientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmbientesRecord.fromSnapshot(s));

  static Future<AmbientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmbientesRecord.fromSnapshot(s));

  static AmbientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AmbientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmbientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmbientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmbientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmbientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmbientesRecordData({
  String? nome,
  DocumentReference? rastreadoresList,
  int? status,
  String? qrCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'rastreadoresList': rastreadoresList,
      'status': status,
      'qrCode': qrCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class AmbientesRecordDocumentEquality implements Equality<AmbientesRecord> {
  const AmbientesRecordDocumentEquality();

  @override
  bool equals(AmbientesRecord? e1, AmbientesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.rastreadoresList == e2?.rastreadoresList &&
        e1?.status == e2?.status &&
        e1?.qrCode == e2?.qrCode;
  }

  @override
  int hash(AmbientesRecord? e) => const ListEquality()
      .hash([e?.nome, e?.rastreadoresList, e?.status, e?.qrCode]);

  @override
  bool isValidKey(Object? o) => o is AmbientesRecord;
}
