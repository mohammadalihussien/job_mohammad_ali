import 'package:dio/dio.dart';
import 'package:job_offers_mohammad_ali/constants/application_endPoints.dart';

class NetworkHelper {
  late Dio _dio = new Dio();
  NetworkHelper(){
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApplicationEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 8), // 60 seconds
      receiveTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 8),
      headers: {
        'Content-Type': 'text/plain',
      },
    );
    _dio.options = baseOptions;
  }

  Future<Response?> get(String url, {Map<String,dynamic>? params}) async {
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return response;
    } on DioException catch (e) {
      print("Error in get ${e.toString()}");

      return null;
    }
  }
  Future<Response?> post(String url, Map<String,dynamic> params, Map<String,dynamic> data) async {
    try {
      Response response =
      await _dio.post(url, queryParameters: params, data: data);
      return response;
    } on DioException catch (e) {
      print("error in post service $e");
      return null;
    }
  }
}