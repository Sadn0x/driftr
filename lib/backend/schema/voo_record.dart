import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VooRecord extends FirestoreRecord {
  VooRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "piloto" field.
  DocumentReference? _piloto;
  DocumentReference? get piloto => _piloto;
  bool hasPiloto() => _piloto != null;

  // "regiao" field.
  String? _regiao;
  String get regiao => _regiao ?? '';
  bool hasRegiao() => _regiao != null;

  // "hora_inicio" field.
  DateTime? _horaInicio;
  DateTime? get horaInicio => _horaInicio;
  bool hasHoraInicio() => _horaInicio != null;

  // "hora_fim" field.
  DateTime? _horaFim;
  DateTime? get horaFim => _horaFim;
  bool hasHoraFim() => _horaFim != null;

  // "quilometragem_reta" field.
  double? _quilometragemReta;
  double get quilometragemReta => _quilometragemReta ?? 0.0;
  bool hasQuilometragemReta() => _quilometragemReta != null;

  // "quilometragem_tracejado" field.
  double? _quilometragemTracejado;
  double get quilometragemTracejado => _quilometragemTracejado ?? 0.0;
  bool hasQuilometragemTracejado() => _quilometragemTracejado != null;

  // "tipo_balao" field.
  String? _tipoBalao;
  String get tipoBalao => _tipoBalao ?? '';
  bool hasTipoBalao() => _tipoBalao != null;

  // "altitude_maxima" field.
  double? _altitudeMaxima;
  double get altitudeMaxima => _altitudeMaxima ?? 0.0;
  bool hasAltitudeMaxima() => _altitudeMaxima != null;

  // "percurso" field.
  List<LatLng>? _percurso;
  List<LatLng> get percurso => _percurso ?? const [];
  bool hasPercurso() => _percurso != null;

  // "posicao" field.
  int? _posicao;
  int get posicao => _posicao ?? 0;
  bool hasPosicao() => _posicao != null;

  // "duracao" field.
  int? _duracao;
  int get duracao => _duracao ?? 0;
  bool hasDuracao() => _duracao != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _piloto = snapshotData['piloto'] as DocumentReference?;
    _regiao = snapshotData['regiao'] as String?;
    _horaInicio = snapshotData['hora_inicio'] as DateTime?;
    _horaFim = snapshotData['hora_fim'] as DateTime?;
    _quilometragemReta = castToType<double>(snapshotData['quilometragem_reta']);
    _quilometragemTracejado =
        castToType<double>(snapshotData['quilometragem_tracejado']);
    _tipoBalao = snapshotData['tipo_balao'] as String?;
    _altitudeMaxima = castToType<double>(snapshotData['altitude_maxima']);
    _percurso = getDataList(snapshotData['percurso']);
    _posicao = castToType<int>(snapshotData['posicao']);
    _duracao = castToType<int>(snapshotData['duracao']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('voo');

  static Stream<VooRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VooRecord.fromSnapshot(s));

  static Future<VooRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VooRecord.fromSnapshot(s));

  static VooRecord fromSnapshot(DocumentSnapshot snapshot) => VooRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VooRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VooRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VooRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VooRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVooRecordData({
  String? uid,
  DocumentReference? piloto,
  String? regiao,
  DateTime? horaInicio,
  DateTime? horaFim,
  double? quilometragemReta,
  double? quilometragemTracejado,
  String? tipoBalao,
  double? altitudeMaxima,
  int? posicao,
  int? duracao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'piloto': piloto,
      'regiao': regiao,
      'hora_inicio': horaInicio,
      'hora_fim': horaFim,
      'quilometragem_reta': quilometragemReta,
      'quilometragem_tracejado': quilometragemTracejado,
      'tipo_balao': tipoBalao,
      'altitude_maxima': altitudeMaxima,
      'posicao': posicao,
      'duracao': duracao,
    }.withoutNulls,
  );

  return firestoreData;
}

class VooRecordDocumentEquality implements Equality<VooRecord> {
  const VooRecordDocumentEquality();

  @override
  bool equals(VooRecord? e1, VooRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.piloto == e2?.piloto &&
        e1?.regiao == e2?.regiao &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFim == e2?.horaFim &&
        e1?.quilometragemReta == e2?.quilometragemReta &&
        e1?.quilometragemTracejado == e2?.quilometragemTracejado &&
        e1?.tipoBalao == e2?.tipoBalao &&
        e1?.altitudeMaxima == e2?.altitudeMaxima &&
        listEquality.equals(e1?.percurso, e2?.percurso) &&
        e1?.posicao == e2?.posicao &&
        e1?.duracao == e2?.duracao;
  }

  @override
  int hash(VooRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.piloto,
        e?.regiao,
        e?.horaInicio,
        e?.horaFim,
        e?.quilometragemReta,
        e?.quilometragemTracejado,
        e?.tipoBalao,
        e?.altitudeMaxima,
        e?.percurso,
        e?.posicao,
        e?.duracao
      ]);

  @override
  bool isValidKey(Object? o) => o is VooRecord;
}
