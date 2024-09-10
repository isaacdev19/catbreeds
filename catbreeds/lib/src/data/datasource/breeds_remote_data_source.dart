import 'package:catbreeds/src/config/rest_consumer/method_type.dart';
import 'package:catbreeds/src/config/rest_consumer/rest_consumer.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';

abstract interface class BreedsRemoteDataSource {
  Future<List<BreedModel>> getCatBreeds();
}

class BreedsRemoteDataSourceImpl implements BreedsRemoteDataSource {
  BreedsRemoteDataSourceImpl({
    required RequestBuilder requestBuilder
  }) : _requestBuilder = requestBuilder;

  final RequestBuilder _requestBuilder;

  @override
  Future<List<BreedModel>> getCatBreeds() async {
    try {
      final response = _requestBuilder
          .path('breeds')
          .method(MethodType.get);
      final responseList = response as List;
      return responseList.map((e) => BreedModel.fromJson(e)).toList();
    } catch(e) {
      throw Exception();
    }
  }
}
