import 'dart:convert';

import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:catbreeds/src/config/rest_consumer/rest_consumer.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';

abstract interface class BreedsRemoteDataSource {
  Future<List<BreedModel>> getCatBreeds();
  Future<List<BreedModel>> getCatBreedByString(String breed);
}

class BreedsRemoteDataSourceImpl implements BreedsRemoteDataSource {
  BreedsRemoteDataSourceImpl({
    required RequestBuilder requestBuilder
  }) : _requestBuilder = requestBuilder;

  final RequestBuilder _requestBuilder;

  @override
  Future<List<BreedModel>> getCatBreeds() async {
    try {
      final response = await _requestBuilder
          .path('breeds')
          .method(MethodType.get);
      final jsonResponse = json.decode(response);
      final responseList = jsonResponse as List;
      return responseList.map((e) => BreedModel.fromJson(e)).toList();
    } catch(e) {
      throw Exception();
    }
  }

  @override
  Future<List<BreedModel>> getCatBreedByString(String breed) async {
    try {
      final response = await _requestBuilder
          .path('breeds/search')
          .queryParameters({'q': breed})
          .method(MethodType.get);
      final jsonResponse = json.decode(response);
      final responseList = jsonResponse as List;
      return responseList.map((e) => BreedModel.fromJson(e)).toList();
    } catch(e) {
      throw Exception();
    }
  }
}
