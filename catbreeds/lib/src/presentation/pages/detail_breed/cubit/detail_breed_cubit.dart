import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_breed_state.dart';

class DetailBreedCubit extends Cubit<DetailBreedState> {
  DetailBreedCubit() : super(DetailBreedInitial());
}
