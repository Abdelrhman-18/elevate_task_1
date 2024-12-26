//TODO:This class is used to handle the response received from the API. If the API call succeeds, it returns the expected result. However, if an error occurs, it provides the error details instead.
class ApiResult<T> {
  final T? data;
  final String? error;

  ApiResult.success(this.data) : error = null;
  ApiResult.error(this.error) : data = null;
  bool get isSuccess => data != null;
  bool get isError => error != null;
}
