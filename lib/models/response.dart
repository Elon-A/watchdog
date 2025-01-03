import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  final String id;
  final String surveyId;
  final String questionId;
  final String userId;
  final dynamic response; // Can be String, int, List, etc.
  final DateTime? createdAt;

  Response({
    required this.id,
    required this.surveyId,
    required this.questionId,
    required this.userId,
    required this.response,
    this.createdAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  Map<String, dynamic> toSupabaseInsertMap() {
    return {
      'survey_id': surveyId,
      'question_id': questionId,
      'user_id': userId,
      'response': response,
    };
  }
}