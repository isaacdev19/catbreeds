import 'dart:convert';

import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:catbreeds/src/config/rest_consumer/rest_consumer.dart';
import 'package:catbreeds/src/data/datasource/breeds_remote_data_source.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'breeds_remote_data_source_test.mocks.dart';

@GenerateMocks([RequestBuilder])
void main() {
  late BreedsRemoteDataSource remoteDataSource;
  late RequestBuilder mockRequestBuilder;

  setUp(() {
    mockRequestBuilder = MockRequestBuilder();
    remoteDataSource = BreedsRemoteDataSourceImpl(requestBuilder: mockRequestBuilder);
  });
  
  group('getCatBreeds', () {
    test('Should return BreedModel when call is success', () async {
      //arrange
      when(mockRequestBuilder.path('breeds')).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.method(MethodType.get)).thenAnswer((_) async => fixture('breed_model_list.json'));
      //act
      final response = await remoteDataSource.getCatBreeds();
      //assert
      verify(mockRequestBuilder.path('breeds')).called(1);
      verify(mockRequestBuilder.method(MethodType.get)).called(1);
      expect(response, isA<List<BreedModel>>());
    });

    test('Should return Exception when call fails', () async {
      //arrange
      when(mockRequestBuilder.path('breeds')).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.method(MethodType.get)).thenThrow(Exception());
      //act
      final response = remoteDataSource.getCatBreeds;
      //assert
      expect(response(), throwsA(isInstanceOf<Exception>()));
      verify(mockRequestBuilder.path('breeds')).called(1);
      verify(mockRequestBuilder.method(MethodType.get)).called(1);
    });
  });

  group('searchBreed', () {
    test('Should return BreedModel when call is success', () async {
      //arrange
      when(mockRequestBuilder.path('breeds/search')).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.queryParameters({'q': 'Aby'})).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.method(MethodType.get)).thenAnswer((_) async => fixture('breed_model_list.json'));
      //act
      final response = await remoteDataSource.searchBreed('Aby');
      //assert
      verify(mockRequestBuilder.path('breeds/search')).called(1);
      verify(mockRequestBuilder.queryParameters({'q': 'Aby'})).called(1);
      verify(mockRequestBuilder.method(MethodType.get)).called(1);
      expect(response, isA<List<BreedModel>>());
    });

    test('Should return Exception when call fails', () async {
      //arrange
      when(mockRequestBuilder.path('breeds/search')).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.queryParameters({'q': 'Aby'})).thenReturn(mockRequestBuilder);
      when(mockRequestBuilder.method(MethodType.get)).thenThrow(Exception());
      //act
      final response = remoteDataSource.searchBreed;
      //assert
      expect(response('Aby'), throwsA(isInstanceOf<Exception>()));
      verify(mockRequestBuilder.path('breeds/search')).called(1);
      verify(mockRequestBuilder.queryParameters({'q': 'Aby'})).called(1);
      verify(mockRequestBuilder.method(MethodType.get)).called(1);
    });
  });
}
