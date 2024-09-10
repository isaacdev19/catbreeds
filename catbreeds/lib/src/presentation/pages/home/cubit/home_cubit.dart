import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/usecases/get_cat_breeds_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetCatBreedsUseCase getCatBreedsUseCase,
  }) : _getCatBreedsUseCase = getCatBreedsUseCase,
        super(HomeState.initialState());

  final GetCatBreedsUseCase _getCatBreedsUseCase;

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
}
