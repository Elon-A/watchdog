import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/survey.dart'; // Import your Survey model
import '../models/question.dart';
import '../models/response.dart';

class SurveyService {
  final supabase = Supabase.instance.client;

  Future<List<Survey>> getPublicSurveys({int limit = 10}) async {
    final response = await supabase
        .from('surveys')
        .select('*')
        .limit(limit);

    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Survey.fromJson(json)).toList();
    }
  }

  Future<Survey> getSurveyById(String id) async {
    final response = await supabase.from('surveys').select('*').eq('id', id).single();
    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      return Survey.fromJson(response.data);
    }
  }

  Future<Survey> createSurvey(Survey survey) async {
    final response = await supabase.from('surveys').insert(survey.toJson()).select().single();

    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      return Survey.fromJson(response.data);
    }
  }

  Future<Survey> updateSurvey(Survey survey) async {
    final response = await supabase.from('surveys').update(survey.toJson()).eq('id', survey.id).select().single();
    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      return Survey.fromJson(response.data);
    }
  }

  Future<void> deleteSurvey(String surveyId) async {
    final response = await supabase.from('surveys').delete().match({'id': surveyId});

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  Future<List<Question>> getQuestionsForSurvey(String surveyId) async {
    final response = await supabase.from('questions').select('*').eq('survey_id', surveyId);

    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Question.fromJson(json)).toList();
    }
  }

  Future<Question> createQuestion(Question question) async {
    final response = await supabase.from('questions').insert(question.toJson()).select().single();

    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      return Question.fromJson(response.data);
    }
  }

    Future<void> deleteQuestion(String questionId) async {
    final response = await supabase.from('questions').delete().match({'id': questionId});

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

    Future<List<Response>> getResponsesForQuestion(String questionId) async {
    final response = await supabase.from('responses').select('*').eq('question_id', questionId);

    if (response.error != null) {
      throw Exception(response.error!.message);
    } else {
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Response.fromJson(json)).toList();
    }
  }

    Future<Response> createResponse(Response response) async {
    final responseFromSupabase = await supabase.from('responses').insert(response.toJson()).select().single();

    if (responseFromSupabase.error != null) {
      throw Exception(responseFromSupabase.error!.message);
    } else {
      return Response.fromJson(responseFromSupabase.data);
    }
  }

    Future<void> deleteResponse(String responseId) async {
    final response = await supabase.from('responses').delete().match({'id': responseId});

    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

}