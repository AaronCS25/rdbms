import 'package:dbms/models/only_api_response_model.dart';
import 'package:dio/dio.dart';

class QueryApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080/query',
    ),
  );

  // Future<Map<String, dynamic>>
  Future<QueryResponseModel> queryPost(String query) async {
    try {
      final response = await dio.post('/query', data: {"query": query});

      if (response.statusCode == 200) {
        return QueryResponseModel.fromJson(response.data);
      } else {
        throw AssertionError('Error query: ${response.statusCode}');
      }
    } catch (e) {
      throw AssertionError('Error query: $e');
    }
  }
}
