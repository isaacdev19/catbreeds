import 'package:catbreeds/src/config/failure.dart';
import 'package:catbreeds/src/data/datasource/breeds_remote_data_source.dart';
import 'package:catbreeds/src/domain/entities/breed.dart';
import 'package:catbreeds/src/domain/repository/breeds_repository.dart';
import 'package:dartz/dartz.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  BreedsRepositoryImpl({
    required BreedsRemoteDataSource remoteDataSource
  }) : _remoteDataSource = remoteDataSource;

  final BreedsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Breed>>> getCatBreeds() async {
    try {
      return Right(await _remoteDataSource.getCatBreeds());
    } catch(e) {
      return const Left(Failure.serverFailure());
    }
  }

  @override
  Future<Either<Failure, List<Breed>>> searchBreed(String breed) async {
    try {
      return Right(await _remoteDataSource.searchBreed(breed));
    } catch(e) {
    return const Left(Failure.serverFailure());
    }
  }
}
