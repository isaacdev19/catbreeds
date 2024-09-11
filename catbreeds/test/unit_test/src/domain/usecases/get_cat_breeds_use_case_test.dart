import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/repository/breeds_repository.dart';
import 'package:catbreeds/src/domain/usecases/get_cat_breeds_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cat_breeds_use_case_test.mocks.dart';

@GenerateMocks([BreedsRepository])
void main() {
  late GetCatBreedsUseCase useCase;
  late BreedsRepository mockRepository;

  const breed = Breed(
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
    mockRepository = MockBreedsRepository();
    useCase = GetCatBreedsUseCase(repository: mockRepository);
  });

  group('GetCatBreedsUseCase', () {
    test('should call getCatBreeds method on breeds repository', () async {
      //arrange
      when(mockRepository.getCatBreeds()).thenAnswer((_) async => const Right([breed]));
      //act
      final response = await useCase(unit);
      //assert
      verify(mockRepository.getCatBreeds()).called(1);
      expect(response, const Right([breed]));
    });

    test('should return Failure when the call getCatBreeds method on breeds repository fails', () async {
      //arrange
      when(mockRepository.getCatBreeds()).thenAnswer((_) async => const Left(ServerFailure()));
      //act
      final response = await useCase(unit);
      //assert
      verify(mockRepository.getCatBreeds()).called(1);
      expect(response, const Left(ServerFailure()));
    });
  });
}
