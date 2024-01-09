import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegioesRecord extends FirestoreRecord {
  RegioesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('regioes');

  static Stream<RegioesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegioesRecord.fromSnapshot(s));

  static Future<RegioesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegioesRecord.fromSnapshot(s));

  static RegioesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegioesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegioesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegioesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegioesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegioesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegioesRecordData({
  String? uid,
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegioesRecordDocumentEquality implements Equality<RegioesRecord> {
  const RegioesRecordDocumentEquality();

  @override
  bool equals(RegioesRecord? e1, RegioesRecord? e2) {
    return e1?.uid == e2?.uid && e1?.nome == e2?.nome;
  }

  @override
  int hash(RegioesRecord? e) => const ListEquality().hash([e?.uid, e?.nome]);

  @override
  bool isValidKey(Object? o) => o is RegioesRecord;
}
