import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresasRecord extends FirestoreRecord {
  EmpresasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "qrCode" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  // "adminRef" field.
  DocumentReference? _adminRef;
  DocumentReference? get adminRef => _adminRef;
  bool hasAdminRef() => _adminRef != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "dataDeCadastro" field.
  DateTime? _dataDeCadastro;
  DateTime? get dataDeCadastro => _dataDeCadastro;
  bool hasDataDeCadastro() => _dataDeCadastro != null;

  // "cpnj" field.
  String? _cpnj;
  String get cpnj => _cpnj ?? '';
  bool hasCpnj() => _cpnj != null;

  // "empresa_id" field.
  String? _empresaId;
  String get empresaId => _empresaId ?? '';
  bool hasEmpresaId() => _empresaId != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _qrCode = snapshotData['qrCode'] as String?;
    _adminRef = snapshotData['adminRef'] as DocumentReference?;
    _foto = snapshotData['foto'] as String?;
    _dataDeCadastro = snapshotData['dataDeCadastro'] as DateTime?;
    _cpnj = snapshotData['cpnj'] as String?;
    _empresaId = snapshotData['empresa_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresas');

  static Stream<EmpresasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresasRecord.fromSnapshot(s));

  static Future<EmpresasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpresasRecord.fromSnapshot(s));

  static EmpresasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresasRecordData({
  String? nome,
  String? qrCode,
  DocumentReference? adminRef,
  String? foto,
  DateTime? dataDeCadastro,
  String? cpnj,
  String? empresaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'qrCode': qrCode,
      'adminRef': adminRef,
      'foto': foto,
      'dataDeCadastro': dataDeCadastro,
      'cpnj': cpnj,
      'empresa_id': empresaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpresasRecordDocumentEquality implements Equality<EmpresasRecord> {
  const EmpresasRecordDocumentEquality();

  @override
  bool equals(EmpresasRecord? e1, EmpresasRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.qrCode == e2?.qrCode &&
        e1?.adminRef == e2?.adminRef &&
        e1?.foto == e2?.foto &&
        e1?.dataDeCadastro == e2?.dataDeCadastro &&
        e1?.cpnj == e2?.cpnj &&
        e1?.empresaId == e2?.empresaId;
  }

  @override
  int hash(EmpresasRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.qrCode,
        e?.adminRef,
        e?.foto,
        e?.dataDeCadastro,
        e?.cpnj,
        e?.empresaId
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpresasRecord;
}
