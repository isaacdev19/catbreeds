import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_breed_state.dart';

class DetailBreedCubit extends Cubit<DetailBreedState> {
  DetailBreedCubit() : super(DetailBreedInitial());
}
