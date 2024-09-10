import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/usecases/getCatBreedByStringUseCase.dart';
import 'package:catbreeds/src/domain/usecases/get_cat_breeds_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetCatBreedsUseCase getCatBreedsUseCase,
    required GetCatBreedByStringUseCase getCatBreedByStringUseCase,
  }) : _getCatBreedsUseCase = getCatBreedsUseCase,
        _getCatBreedByStringUseCase = getCatBreedByStringUseCase,
        super(HomeState.initialState());

  final GetCatBreedsUseCase _getCatBreedsUseCase;
  final GetCatBreedByStringUseCase _getCatBreedByStringUseCase;

  Future<void> getCatBreeds() async {
    emit(state.copyWith(
      status: HomeStatus.loading
    ));

    final responseBox = await _getCatBreedsUseCase(unit);
    final response = responseBox.fold(
          (failure) => failure,
          (breeds) => breeds,
    );

    if(responseBox.isLeft()) {
      emit(state.copyWith(
        status: HomeStatus.error,
        croutonMessage: ''
      ));
      return;
    }

    emit(state.copyWith(
      status: HomeStatus.loaded,
      breeds: response as List<Breed>
    ));
  }

  Future<void> searchBreed(String value) async {
    emit(state.copyWith(
        status: HomeStatus.loading
    ));

    if(value.isEmpty){
      await getCatBreeds();
      return;
    }

    final responseBox = await _getCatBreedByStringUseCase(value);
    final response = responseBox.fold(
          (failure) => failure,
          (breeds) => breeds,
    );

    if(responseBox.isLeft()) {
      emit(state.copyWith(
          status: HomeStatus.error,
          croutonMessage: ''
      ));
      return;
    }

    emit(state.copyWith(
        status: HomeStatus.loaded,
        breeds: response as List<Breed>
    ));
  }
}
