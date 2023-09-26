import 'package:dio/dio.dart';

class QueryApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );

  // Future<Map<String, dynamic>>
  Future<bool> queryPost(String query) async {
    try {
      final response = await dio.post('/', data: {"query": query});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw AssertionError('Error query: $e');
    }
  }
}
