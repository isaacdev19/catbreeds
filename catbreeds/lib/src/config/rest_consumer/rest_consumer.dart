import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/config/rest_consumer/api_client.dart';
import 'package:catbreeds/src/config/rest_consumer/api_request.dart';
import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:http/http.dart' as http;

abstract class RequestBuilder {
  static const maxAttempts = 3;

  RequestBuilder path(String path);

  RequestBuilder headers(Map<String, String> headers);

  RequestBuilder queryParameters(Map<String, String> parameters);

  Future<String> method(MethodType methodType, {bool isMultipart});
}

class RequestBuilderImpl implements RequestBuilder {
  RequestBuilderImpl({
    required HttpRestClient client,
  })  : _client = client;

  final HttpRestClient _client;
  ApiRequest query = ApiRequest();
  final Map<String, String > contentHeader = {
    'Content-Type': 'application/json',
    'x-api-key': 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
  };

  @override
  RequestBuilderImpl path(String path) {
    query.path = path;
    return this;
  }

  @override
  RequestBuilderImpl headers(Map<String, String> headers) {
    query.headers = headers;
    return this;
  }

  @override
  RequestBuilderImpl queryParameters(Map<String, String> parameters) {
    query.queryParameters = parameters;
    return this;
  }

  @override
  Future<String> method(MethodType methodType, {bool isMultipart = false}) async {
    switch (methodType) {
      case MethodType.get:
        return _getMethod();
    }
  }

  Future<String> _getMethod() async {
    final request = _createRequest();
    final response = await _client.get(request);
    return _processResponse(response);
  }

  String _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    }

    throw ServerFailure(message: response.toString());
  }

  ApiRequest _createRequest() => ApiRequest(
    path: query.path ?? '',
    body: query.body,
    queryParameters: query.queryParameters,
    headers: query.headers ?? contentHeader,
  );
}
