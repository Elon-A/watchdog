import 'package:json_annotation/json_annotation.dart';

part 'survey.g.dart';

@JsonSerializable()
class Survey {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdAt;

  Survey({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.createdAt,
  });

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyToJson(this);

  // Add a convenience method to create a Survey for inserting into Supabase (without id and createdAt)
  Map<String, dynamic> toSupabaseInsertMap() {
    return {
      'user_id': userId,
      'title': title,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
    };
  }
}