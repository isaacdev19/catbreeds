import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/config/rest_consumer/api_client.dart';
import 'package:catbreeds/src/config/rest_consumer/api_request.dart';
import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:catbreeds/src/config/rest_consumer/rest_consumer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'rest_consumer_test.mocks.dart';

@GenerateMocks([HttpRestClient])
void main() {
  late MockHttpRestClient mockHttpRestClient;
  late RequestBuilderImpl requestBuilder;

  const path = 'test-path';
  const headers = {'key': 'value-test'};
  const queryParameters = {'key': 'parameter-test'};

  setUp(() {
    mockHttpRestClient = MockHttpRestClient();
    requestBuilder = RequestBuilderImpl(client: mockHttpRestClient);
  });

  group('path', () {
    test('Add path to query successfully', () {
      //act
      final response = requestBuilder.path(path);
      //assert
      expect(response.query.path, path);
    });
  });

  group('headers', () {
    test('Add headers to query successfully', () {
      //act
      final response = requestBuilder.headers(headers);
      //assert
      expect(response.query.headers, headers);
    });
  });

  group('queryParameters', () {
    test('Add queryParameters to query successfully', () {
      //act
      final response = requestBuilder.queryParameters(queryParameters);
      //assert
      expect(response.query.queryParameters, queryParameters);
    });
  });

  group('method', () {
    final request = ApiRequest(
      path: path,
      headers: headers,
      queryParameters: queryParameters,
    );

    test('when call method get return success', () async {
      //arrange
      final restOptionsMatcher = predicate<ApiRequest>(
            (restOptions) => restOptions.path == request.path,
      );
      when(mockHttpRestClient.get(argThat(restOptionsMatcher)))
          .thenAnswer((_) async => http.Response('Test Response', 200));
      //act
      final response = await requestBuilder
          .path(path)
          .headers(headers)
          .queryParameters(queryParameters)
          .method(MethodType.get);
      //assert
      verify(mockHttpRestClient.get(argThat(restOptionsMatcher))).called(1);
      expect(response, 'Test Response');
    });

    test('when call method get return ServerException', () async {
      //arrange
      final restOptionsMatcher = predicate<ApiRequest>(
            (restOptions) => restOptions.path == request.path,
      );
      when(mockHttpRestClient.get(argThat(restOptionsMatcher)))
          .thenAnswer((_) async => http.Response('Test Error Response', 500));
      //act
      expect(
            () async => requestBuilder
            .path(path)
            .headers(headers)
            .queryParameters(queryParameters)
            .method(MethodType.get),
        throwsA(isA<ServerFailure>()),
      );
      //assert
      verify(mockHttpRestClient.get(argThat(restOptionsMatcher))).called(1);
    });
  });
}
