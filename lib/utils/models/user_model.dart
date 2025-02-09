// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:core/utils/models/city_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
final class UserModel {
  UserModel({
    this.uid,
    this.name,
    this.about,
    this.birthDate,
    this.gender,
    this.livingCity,
    this.workCity,
    this.occupation,
    this.interests,
    this.hobbies,
    this.imageUrl,
    this.membershipStartDate,
    this.membershipEndDate,
    this.mentorId,
    this.members,
    this.role,
    this.mentatId,
    this.phoneNumber,
    this.mentors,
    this.memberNumber,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  final String? uid;
  @JsonKey(
    fromJson: convertIntToString,
    toJson: convertStringToInteger,
  )
  final String? memberNumber;
  final String? imageUrl;
  final String? name;
  final String? about;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? birthDate;
  final Gender? gender;
  @JsonKey(toJson: _cityToJson)
  final City? livingCity;
  @JsonKey(toJson: _cityToJson)
  final City? workCity;
  final String? occupation;
  final List<String>? hobbies;
  final List<String>? interests;
  final String? mentorId;
  final String? mentatId;
  final List<String>? mentors;
  final List<String>? members;

  final List<Role?>? role;
  final String? phoneNumber;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? membershipStartDate;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? membershipEndDate;

  UserModel copyWith({
    String? uid,
    String? imageUrl,
    String? name,
    String? about,
    DateTime? birthDate,
    Gender? gender,
    City? livingCity,
    City? workCity,
    String? occupation,
    List<String>? hobbies,
    List<String>? interests,
    String? mentorId,
    String? mentatId,
    List<String>? members,
    List<Role?>? role,
    DateTime? membershipStartDate,
    DateTime? membershipEndDate,
    String? phoneNumber,
    List<String>? mentors,
    String? memberNumber,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      about: about ?? this.about,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      livingCity: livingCity ?? this.livingCity,
      workCity: workCity ?? this.workCity,
      occupation: occupation ?? this.occupation,
      hobbies: hobbies ?? this.hobbies,
      interests: interests ?? this.interests,
      mentorId: mentorId ?? this.mentorId,
      mentatId: mentatId ?? this.mentatId,
      members: members ?? this.members,
      role: role ?? this.role,
      membershipStartDate: membershipStartDate ?? this.membershipStartDate,
      membershipEndDate: membershipEndDate ?? this.membershipEndDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mentors: mentors ?? this.mentors,
      memberNumber: memberNumber ?? this.memberNumber,
    );
  }

  static String? convertIntToString(int? e) => e.toString();
  static int convertStringToInteger(String? e) => int.tryParse(e ?? '') ?? 0;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  static Map<String, dynamic>? _cityToJson(City? city) => city?.toJson();
  @override
  String toString() {
    // ignore: leading_newlines_in_multiline_strings
    return '''
UserModel( 
     'uid': $uid,
      'imageUrl': $imageUrl,
      'name': $name,
      'memberNumber': $memberNumber,
      'about': $about,
      'birthDate': $birthDate,
      'gender': $gender,
      'livingCity': $livingCity,
      'workCity': $workCity,
      'occupation': $occupation,
      'hobbies': $hobbies,
      'interests': $interests,
      'mentorId': $mentorId,
      'mentatId': $mentatId,
      'members': $members,
      'role': $role,
      'phoneNumber': $phoneNumber,
      'membershipStartDate':
          $membershipStartDate,
      'membershipEndDate':
          $membershipEndDate,''';
  }
}
