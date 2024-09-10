class ApiRequest {
  ApiRequest({
    this.path,
    this.body,
    this.queryParameters,
    this.headers,
  });

  String? path;
  Map<String, dynamic>? body;
  Map<String, String>? queryParameters;
  Map<String, String>? headers;
}
