// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      surveyId: json['surveyId'] as String,
      questionText: json['questionText'] as String,
      questionType: json['questionType'] as String,
      options: json['options'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'surveyId': instance.surveyId,
      'questionText': instance.questionText,
      'questionType': instance.questionType,
      'options': instance.options,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
