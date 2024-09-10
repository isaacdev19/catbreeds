import 'package:catbreeds/src/config/rest_consumer/api_client.dart';
import 'package:catbreeds/src/config/rest_consumer/rest_consumer.dart';
import 'package:catbreeds/src/data/datasource/breeds_remote_data_source.dart';
import 'package:catbreeds/src/data/repository/breeds_repository_impl.dart';
import 'package:catbreeds/src/domain/repository/breeds_repository.dart';
import 'package:catbreeds/src/domain/usecases/getCatBreedByStringUseCase.dart';
import 'package:catbreeds/src/domain/usecases/get_cat_breeds_use_case.dart';
import 'package:catbreeds/src/presentation/pages/home/cubit/home_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
/// Cubit
  serviceLocator..registerFactory<HomeCubit>(
    () => HomeCubit(
      getCatBreedsUseCase: serviceLocator(),
      getCatBreedByStringUseCase: serviceLocator(),
    ),
  )

///UseCases
  ..registerLazySingleton<GetCatBreedsUseCase>(
    () => GetCatBreedsUseCase(
      repository: serviceLocator(),
    ),
  )

  ..registerLazySingleton<GetCatBreedByStringUseCase>(
    () => GetCatBreedByStringUseCase(
      repository: serviceLocator(),
    ),
  )

///Repository
  ..registerLazySingleton<BreedsRepository>(
    () => BreedsRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  )
///DataSource
  ..registerLazySingleton<BreedsRemoteDataSource>(
    () => BreedsRemoteDataSourceImpl(
      requestBuilder: serviceLocator(),
    ),
  )
///Config
  ..registerLazySingleton<RequestBuilder>(
    () => RequestBuilderImpl(
      client: serviceLocator(),
    ),
  )
  ..registerLazySingleton<HttpRestClient>(
    () => APIClient(
      client: http.Client(),
    ),
  );
}

