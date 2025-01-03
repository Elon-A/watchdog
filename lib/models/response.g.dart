// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      id: json['id'] as String,
      surveyId: json['surveyId'] as String,
      questionId: json['questionId'] as String,
      userId: json['userId'] as String,
      response: json['response'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'surveyId': instance.surveyId,
      'questionId': instance.questionId,
      'userId': instance.userId,
      'response': instance.response,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
