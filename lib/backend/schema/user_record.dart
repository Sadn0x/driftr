import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "Type_of_balloon" field.
  String? _typeOfBalloon;
  String get typeOfBalloon => _typeOfBalloon ?? '';
  bool hasTypeOfBalloon() => _typeOfBalloon != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "golden_medals" field.
  int? _goldenMedals;
  int get goldenMedals => _goldenMedals ?? 0;
  bool hasGoldenMedals() => _goldenMedals != null;

  // "silver_medals" field.
  int? _silverMedals;
  int get silverMedals => _silverMedals ?? 0;
  bool hasSilverMedals() => _silverMedals != null;

  // "bronze_medals" field.
  int? _bronzeMedals;
  int get bronzeMedals => _bronzeMedals ?? 0;
  bool hasBronzeMedals() => _bronzeMedals != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "registro_balao" field.
  String? _registroBalao;
  String get registroBalao => _registroBalao ?? '';
  bool hasRegistroBalao() => _registroBalao != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _typeOfBalloon = snapshotData['Type_of_balloon'] as String?;
    _nationality = snapshotData['nationality'] as String?;
    _goldenMedals = castToType<int>(snapshotData['golden_medals']);
    _silverMedals = castToType<int>(snapshotData['silver_medals']);
    _bronzeMedals = castToType<int>(snapshotData['bronze_medals']);
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _registroBalao = snapshotData['registro_balao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  String? typeOfBalloon,
  String? nationality,
  int? goldenMedals,
  int? silverMedals,
  int? bronzeMedals,
  LatLng? localizacao,
  String? registroBalao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_name': userName,
      'Type_of_balloon': typeOfBalloon,
      'nationality': nationality,
      'golden_medals': goldenMedals,
      'silver_medals': silverMedals,
      'bronze_medals': bronzeMedals,
      'localizacao': localizacao,
      'registro_balao': registroBalao,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.typeOfBalloon == e2?.typeOfBalloon &&
        e1?.nationality == e2?.nationality &&
        e1?.goldenMedals == e2?.goldenMedals &&
        e1?.silverMedals == e2?.silverMedals &&
        e1?.bronzeMedals == e2?.bronzeMedals &&
        e1?.localizacao == e2?.localizacao &&
        e1?.registroBalao == e2?.registroBalao;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.typeOfBalloon,
        e?.nationality,
        e?.goldenMedals,
        e?.silverMedals,
        e?.bronzeMedals,
        e?.localizacao,
        e?.registroBalao
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
