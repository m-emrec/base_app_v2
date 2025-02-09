import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/enums/feedback_titles_enum.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  final String feedbackId;
  final String content;
  final FeedbackTitlesEnum? feedbackTitle;
  final FeedbackSubTitlesEnum? feedbackSubTitle;
  final String? response;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime createdAt;
  final List<String>? imageUrls;
  final String? reportedUserId;
  final String? userId;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);

  FeedbackModel copyWith({
    String? feedbackId,
    String? content,
    FeedbackTitlesEnum? feedbackTitle,
    FeedbackSubTitlesEnum? feedbackSubTitle,
    DateTime? createdAt,
    List<String>? imageUrls,
    String? reportedUserId,
    String? userId,
    String? response,
  }) {
    return FeedbackModel(
      feedbackId: feedbackId ?? this.feedbackId,
      content: content ?? this.content,
      feedbackTitle: feedbackTitle ?? this.feedbackTitle,
      feedbackSubTitle: feedbackSubTitle ?? this.feedbackSubTitle,
      createdAt: createdAt ?? this.createdAt,
      imageUrls: imageUrls ?? this.imageUrls,
      reportedUserId: reportedUserId ?? this.reportedUserId,
      userId: userId ?? this.userId,
      response: response ?? this.response,
    );
  }

  FeedbackModel({
    required this.feedbackId,
    required this.content,
    this.feedbackTitle,
    this.feedbackSubTitle,
    this.response,
    required this.createdAt,
    this.imageUrls,
    this.reportedUserId,
    this.userId,
  });
}
