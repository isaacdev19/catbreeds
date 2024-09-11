import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/data/datasource/breeds_remote_data_source.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:catbreeds/src/data/repository/breeds_repository_impl.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/repository/breeds_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'breeds_repository_impl_test.mocks.dart';

@GenerateMocks([BreedsRemoteDataSource])
void main() {
  late BreedsRepository repository;
  late BreedsRemoteDataSource mockRemoteDataSource;

  const breed = BreedModel(
    id: 'abys',
    name: 'Abyssinian',
    origin: 'Egypt',
    description: 'The Abyssinian is easy to care for, and a joy to have in your home.',
    webUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
    image: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
    lifeSpan: '14 - 15',
    intelligence: 5,
    childFriendly: 3,
    affectionLevel: 5,
    adaptability: 5,
  );

  setUp(() {
    mockRemoteDataSource = MockBreedsRemoteDataSource();
    repository = BreedsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getCatBreeds', () {
    test('should call getCatBreeds method on breeds remote datasource', () async {
      //arrange
      when(mockRemoteDataSource.getCatBreeds()).thenAnswer((_) async => const [breed]);
      //act
      final response = await repository.getCatBreeds();
      //assert
      verify(mockRemoteDataSource.getCatBreeds()).called(1);
      expect(response, const Right([breed]));
    });

    test('should return Failure when the call getCatBreeds method on breeds remote datasource fails', () async {
      //arrange
      when(mockRemoteDataSource.getCatBreeds()).thenThrow(Exception);
      //act
      final response = await repository.getCatBreeds();
      //assert
      verify(mockRemoteDataSource.getCatBreeds()).called(1);
      expect(response, const Left(ServerFailure()));
    });
  });

  group('searchBreed', () {
    test('should call searchBreed method on breeds remote datasource', () async {
      //arrange
      when(mockRemoteDataSource.searchBreed('Aby')).thenAnswer((_) async => const [breed]);
      //act
      final response = await repository.searchBreed('Aby');
      //assert
      verify(mockRemoteDataSource.searchBreed('Aby')).called(1);
      expect(response, const Right([breed]));
    });

    test('should return Failure when the call searchBreed method on breeds remote datasource fails', () async {
      //arrange
      when(mockRemoteDataSource.searchBreed('Aby')).thenThrow(Exception);
      //act
      final response = await repository.searchBreed('Aby');
      //assert
      verify(mockRemoteDataSource.searchBreed('Aby')).called(1);
      expect(response, const Left(ServerFailure()));
    });
  });
}
