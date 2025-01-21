abstract class BaseApiService {
  Future<dynamic> getApi(String url, {Map<String, dynamic>? pathParams,
      Map<String, dynamic>? queryParams});
  Future<dynamic> postApi(String url, Map<String, dynamic> body);
}
