// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      feedbackId: json['feedbackId'] as String,
      content: json['content'] as String,
      feedbackTitle: $enumDecodeNullable(
          _$FeedbackTitlesEnumEnumMap, json['feedbackTitle']),
      feedbackSubTitle: $enumDecodeNullable(
          _$FeedbackSubTitlesEnumEnumMap, json['feedbackSubTitle']),
      response: json['response'] as String?,
      createdAt: FirebaseTimeParser.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?) ??
          DateTime.now(),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reportedUserId: json['reportedUserId'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'feedbackId': instance.feedbackId,
      'content': instance.content,
      'feedbackTitle': _$FeedbackTitlesEnumEnumMap[instance.feedbackTitle],
      'feedbackSubTitle':
          _$FeedbackSubTitlesEnumEnumMap[instance.feedbackSubTitle],
      'response': instance.response,
      'createdAt': FirebaseTimeParser.dateTimeToTimestamp(instance.createdAt),
      'imageUrls': instance.imageUrls,
      'reportedUserId': instance.reportedUserId,
      'userId': instance.userId,
    };

const _$FeedbackTitlesEnumEnumMap = {
  FeedbackTitlesEnum.aboutPerson: 'aboutPerson',
  FeedbackTitlesEnum.aboutApp: 'aboutApp',
  FeedbackTitlesEnum.aboutEvent: 'aboutEvent',
  FeedbackTitlesEnum.aboutCommunity: 'aboutCommunity',
  FeedbackTitlesEnum.general: 'general',
};

const _$FeedbackSubTitlesEnumEnumMap = {
  FeedbackSubTitlesEnum.aboutAMember: 'aboutAMember',
  FeedbackSubTitlesEnum.aboutAnAdmin: 'aboutAnAdmin',
  FeedbackSubTitlesEnum.inappropriateBehavior: 'inappropriateBehavior',
  FeedbackSubTitlesEnum.bugReport: 'bugReport',
  FeedbackSubTitlesEnum.featureRequest: 'featureRequest',
  FeedbackSubTitlesEnum.performanceIssue: 'performanceIssue',
  FeedbackSubTitlesEnum.cancellation: 'cancellation',
  FeedbackSubTitlesEnum.misinformation: 'misinformation',
  FeedbackSubTitlesEnum.poorOrganization: 'poorOrganization',
  FeedbackSubTitlesEnum.offensiveContent: 'offensiveContent',
  FeedbackSubTitlesEnum.spam: 'spam',
  FeedbackSubTitlesEnum.threats: 'threats',
  FeedbackSubTitlesEnum.another: 'another',
};
