import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:dartz/dartz.dart';

abstract interface class BreedsRepository {
  Future<Either<Failure, List<Breed>>> getCatBreeds();
  Future<Either<Failure, List<Breed>>> getCatBreedByString(String breed);
}