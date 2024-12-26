import 'package:dio/dio.dart';
import 'package:elevate_task/core/Network/Api_Service/apiConsumer.dart';
import 'package:elevate_task/core/Network/Api_Service/api_error.dart';

/// TODO:`DioService` implements the `ApiConsumer` interface to handle HTTP requests
/// TODO: using the Dio package. It provides methods for GET and POST requests.
class DioService implements ApiConsumer {
  final Dio dio;

  //TODO: Constructor for initializing Dio instance.
  DioService({required this.dio});

  @override
  Future get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      //TODO: Sending GET request using Dio.
      var response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      //TODO: Handling Dio errors using a custom error handler.
      throw handleDioError(e);
    }
  }
  @override
  Future post(String url, Map<String, dynamic>? body) async {
    try {
      //TODO: Sending POST request using Dio.
      final res = await dio.post(url, data: body);
      return res.data;
    } on DioException catch (e) {
      //TODO: Handling Dio errors using a custom error handler.
      throw handleDioError(e);
    }
  }
}
