import 'package:dio/dio.dart';
import 'package:elevate_task/core/Network/Api_Service/Api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//TODO:This class checks if an object already exists in Dio and returns it. If no object exists, it creates and returns a new one.
class DioFactory {
  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
    ))
      ..interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        error: true,
        request: true,
      ));
    return _dio!;
  }
}
