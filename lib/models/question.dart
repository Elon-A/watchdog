import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart'; // This line MUST be the first line after imports

@JsonSerializable()
class Question {
  final String id;
  final String surveyId;
  final String questionText;
  final String questionType;
  final Map<String, dynamic>? options;
  final DateTime? createdAt;

  Question({
    required this.id,
    required this.surveyId,
    required this.questionText,
    required this.questionType,
    this.options,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  Map<String, dynamic> toSupabaseInsertMap() {
    return {
      'survey_id': surveyId,
      'question_text': questionText,
      'question_type': questionType,
      'options': options,
    };
  }
}