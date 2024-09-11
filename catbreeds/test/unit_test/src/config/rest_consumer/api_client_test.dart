import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/config/rest_consumer/api_client.dart';
import 'package:catbreeds/src/config/rest_consumer/api_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late http.Client mockHttpClient;
  late APIClient apiClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = APIClient(client: mockHttpClient);
  });

  group('get', () {
    test('get should make a GET request', () async {
      //arrange
      final request = ApiRequest(path: 'test-path');
      when(mockHttpClient.get(Uri.https('api.thecatapi.com', '/v1/${request.path}', request.queryParameters,), headers: null))
          .thenAnswer((_) async => http.Response('Test Response', 200));
      //act
      final response = await apiClient.get(request);
      //assert
      verify(mockHttpClient.get(Uri.https('api.thecatapi.com', '/v1/${request.path}', request.queryParameters,), headers: null)).called(1);
      expect(response.body, 'Test Response');
      expect(response.statusCode, 200);
    });

    test('GET request with error', () async {
      //arrange
      final request = ApiRequest(path: 'test-path');
      when(mockHttpClient.get(Uri.https('api.thecatapi.com', '/v1/${request.path}', request.queryParameters,), headers: null))
          .thenThrow(const ServerFailure());
      //act
      expect(() => apiClient.get(request), throwsA(isA<ServerFailure>()));
      //assert
      verify(mockHttpClient.get(Uri.https('api.thecatapi.com', '/v1/${request.path}', request.queryParameters,), headers: null)).called(1);
    });
  });
}
