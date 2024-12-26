import 'package:dio/dio.dart';
//TODO:The advantage of this class is that it handles any error coming from the Api and sends an exception with it.
Exception handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return Exception("Connection error: ${e.message}");
    case DioExceptionType.badResponse:
      return Exception("Invalid response from server: ${e.response?.data}");
    case DioExceptionType.cancel:
      return Exception("Request was cancelled.");
    default:
      return Exception("Unexpected error: ${e.message}");
  }
}