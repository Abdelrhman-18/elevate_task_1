//TODO: Abstract class `ApiConsumer` defines a contract for making HTTP requests.
//TODO:It includes methods for performing GET and POST operations.
abstract class ApiConsumer {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String url, Map<String, dynamic>? body);
}
