import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/repository/breeds_repository.dart';
import 'package:catbreeds/src/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetCatBreedsUseCase extends UseCase<List<Breed>, Unit> {
  GetCatBreedsUseCase({
    required BreedsRepository repository
  }) : _repository = repository;

  final BreedsRepository _repository;

  @override
  Future<Either<Failure, List<Breed>>> call(Unit params) async {
    return await _repository.getCatBreeds();
  }
}