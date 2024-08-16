import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/utils/dio_client.dart';

class EvaluationsRepo {
  EvaluationsRepo({required this.client});

  final DioClient client;

  Future<List<EvaluationModel>> getEvaluations({
    required String? password,
    String? search = '',
  }) async {
    Map<String, dynamic> response = await client.get(
      'evaluation/get',
      password: password,
    );

    return EvaluationModel.listFromJson(response['data']);
  }

  Future<List<String>> getEvaluationTypes({
    required String? password,
    String? search = '',
  }) async {
    Map<String, dynamic> response = await client.get(
      'evaluationrules/types',
      password: password,
    );

    return response['data'];
  }

  Future<bool> addEvaluation({
    required String? password,
    required EvaluationModel evaluation,
  }) async {
    Map<String, dynamic> response = await client.post(
      'evaluation',
      password: password,
      data: evaluation.toJson(),
    );

    return response['status'];
  }

  Future<bool> editEvaluation({
    required String? password,
    required EvaluationModel evaluation,
  }) async {
    Map<String, dynamic> response = await client.post(
      'evaluation/update',
      password: password,
      data: evaluation.toJson(),
    );

    return response['status'];
  }

  Future<bool> deleteEvaluation({
    required String? password,
    required EvaluationModel evaluation,
  }) async {
    Map<String, dynamic> response = await client.delete(
      'evaluation/delete?id=${evaluation.id}',
      password: password,
    );

    return response['status'];
  }
}
