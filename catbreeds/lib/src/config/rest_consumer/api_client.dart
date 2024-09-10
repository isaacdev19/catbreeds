import 'dart:developer';

import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/config/rest_consumer/api_request.dart';
import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:http/http.dart' as http;

abstract class HttpRestClient {
  Future<http.Response> get(ApiRequest request);
}

class APIClient implements HttpRestClient {
  const APIClient({
    required http.Client client,
  })  : _client = client;

  final http.Client _client;

  @override
  Future<http.Response> get(ApiRequest request) async {
    const methodType = MethodType.get;
    try {
      Uri url = _createUrl(request);

      final restOperation = _client.get(url, headers: request.headers);

      final response = await restOperation;

      _logResponse(request, response, methodType);

      return response;
    } catch (exception) {
      _logException(exception, request, methodType);

      throw ServerFailure(message: exception.toString());
    }
  }

  Uri _createUrl(ApiRequest request) {
    final url = Uri.https(
      'api.thecatapi.com',
      '/v1/${request.path}',
      request.queryParameters,
    );

    return url;
  }
}

void _logResponse(
    ApiRequest request, http.Response response, MethodType methodType) {
  log(
    '''

-----------------------------------------------------------------------------------------------------
* lib/core/network/api_client.dart

[HTTP_REQUEST_SUCCESSFUL] -> ${methodType.name}(request)

* request:
${request.path}

* response:
status code: ${response.statusCode}
body:
${response.body}

-----------------------------------------------------------------------------------------------------

''',
  );
}

void _logException(
    Object exception, ApiRequest request, MethodType methodType) {
  log(
    '''

-----------------------------------------------------------------------------------------------------
* lib/core/network/api_client.dart

[HTTP_REQUEST_EXCEPTION] -> ${methodType.name}(request)

* request:
${request.path}

* response:
$exception

-----------------------------------------------------------------------------------------------------

''',
  );
}
