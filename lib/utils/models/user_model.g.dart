// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      about: json['about'] as String?,
      birthDate: json['birthDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['birthDate'] as Timestamp?),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      livingCity: json['livingCity'] == null
          ? null
          : City.fromJson(json['livingCity'] as Map<String, dynamic>),
      workCity: json['workCity'] == null
          ? null
          : City.fromJson(json['workCity'] as Map<String, dynamic>),
      occupation: json['occupation'] as String?,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hobbies:
          (json['hobbies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String?,
      membershipStartDate: json['membershipStartDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['membershipStartDate'] as Timestamp?),
      membershipEndDate: json['membershipEndDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['membershipEndDate'] as Timestamp?),
      mentorId: json['mentorId'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      role: (json['role'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$RoleEnumMap, e))
          .toList(),
      mentatId: json['mentatId'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      mentors:
          (json['mentors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      memberNumber:
          UserModel.convertIntToString((json['memberNumber'] as num?)?.toInt()),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'memberNumber': UserModel.convertStringToInteger(instance.memberNumber),
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'about': instance.about,
      'birthDate': FirebaseTimeParser.dateTimeToTimestamp(instance.birthDate),
      'gender': _$GenderEnumMap[instance.gender],
      'livingCity': UserModel._cityToJson(instance.livingCity),
      'workCity': UserModel._cityToJson(instance.workCity),
      'occupation': instance.occupation,
      'hobbies': instance.hobbies,
      'interests': instance.interests,
      'mentorId': instance.mentorId,
      'mentatId': instance.mentatId,
      'mentors': instance.mentors,
      'members': instance.members,
      'role': instance.role?.map((e) => _$RoleEnumMap[e]).toList(),
      'phoneNumber': instance.phoneNumber,
      'membershipStartDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipStartDate),
      'membershipEndDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipEndDate),
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
};

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.member: 'member',
  Role.guest: 'guest',
  Role.approvedGuest: 'approvedGuest',
  Role.mentat: 'mentat',
  Role.mentor: 'mentor',
  Role.other: 'other',
};
