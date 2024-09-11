import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/usecases/get_cat_breeds_use_case.dart';
import 'package:catbreeds/src/domain/usecases/search_breed_use_case.dart';
import 'package:catbreeds/src/presentation/pages/home/cubit/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([
  GetCatBreedsUseCase,
  SearchBreedUseCase,
])
void main() {
  group('HomeCubit: getCatBreeds', () {
    late GetCatBreedsUseCase mockGetCatBreedsUseCase;
    late SearchBreedUseCase mockSearchBreedUseCase;
    late HomeState initialState;
    late List<Breed> breed;
    late HomeCubit sut;

    setUp(() {
      mockGetCatBreedsUseCase = MockGetCatBreedsUseCase();
      mockSearchBreedUseCase = MockSearchBreedUseCase();
      sut = HomeCubit(getCatBreedsUseCase: mockGetCatBreedsUseCase, getCatBreedByStringUseCase: mockSearchBreedUseCase);

      initialState = HomeState.initialState();

      breed = [
        const BreedModel(
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
        ),
      ];
    });

    blocTest<HomeCubit, HomeState>(
      'Should emit states loading and loaded if call is success',
      build: () => sut,
      seed: () => initialState,
      setUp: () {
        when(mockGetCatBreedsUseCase(unit)).thenAnswer((_) async => Right(breed));
      },
      act: (bloc) => bloc.getCatBreeds(),
      expect: () => [
        initialState.copyWith(
          status: HomeStatus.loading,
        ),
        initialState.copyWith(
          status: HomeStatus.loaded,
          breeds: breed,
        ),
      ]
    );

    blocTest<HomeCubit, HomeState>(
        'Should emit error state if call fails',
        build: () => sut,
        seed: () => initialState,
        setUp: () {
          when(mockGetCatBreedsUseCase(unit)).thenAnswer((_) async => const Left(Failure.serverFailure()));
        },
        act: (bloc) => bloc.getCatBreeds(),
        expect: () => [
          initialState.copyWith(
            status: HomeStatus.loading,
          ),
          initialState.copyWith(
            status: HomeStatus.error,
            croutonMessage: '',
          ),
        ]
    );
  });

  group('HomeCubit: searchBreed', () {
    late GetCatBreedsUseCase mockGetCatBreedsUseCase;
    late SearchBreedUseCase mockSearchBreedUseCase;
    late HomeState initialState;
    late List<Breed> breed;
    late HomeCubit sut;

    setUp(() {
      mockGetCatBreedsUseCase = MockGetCatBreedsUseCase();
      mockSearchBreedUseCase = MockSearchBreedUseCase();
      sut = HomeCubit(getCatBreedsUseCase: mockGetCatBreedsUseCase, getCatBreedByStringUseCase: mockSearchBreedUseCase);

      initialState = HomeState.initialState();

      breed = [
        const BreedModel(
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
        ),
      ];
    });

    blocTest<HomeCubit, HomeState>(
        'Should emit states loading and loaded if call is success',
        build: () => sut,
        seed: () => initialState,
        setUp: () {
          when(mockSearchBreedUseCase('Aby')).thenAnswer((_) async => Right(breed));
        },
        act: (bloc) => bloc.searchBreed('Aby'),
        expect: () => [
          initialState.copyWith(
            status: HomeStatus.loading,
          ),
          initialState.copyWith(
            status: HomeStatus.loaded,
            breeds: breed,
          ),
        ]
    );

    blocTest<HomeCubit, HomeState>(
        'Should emit error state if call fails',
        build: () => sut,
        seed: () => initialState,
        setUp: () {
          when(mockSearchBreedUseCase('Aby')).thenAnswer((_) async => const Left(Failure.serverFailure()));
        },
        act: (bloc) => bloc.searchBreed('Aby'),
        expect: () => [
          initialState.copyWith(
            status: HomeStatus.loading,
          ),
          initialState.copyWith(
            status: HomeStatus.error,
            croutonMessage: '',
          ),
        ]
    );
  });
}
