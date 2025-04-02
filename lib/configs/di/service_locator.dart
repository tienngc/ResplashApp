import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/collection_repository.dart';
import '../../data/repositories/collection_repository_impl.dart';
import '../../data/repositories/photo_repository.dart';
import '../../data/repositories/photo_repository_impl.dart';
import '../../data/repositories/search_repository.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/sources/collection_data_source.dart';
import '../../data/sources/photo_data_source.dart';
import '../../data/sources/search_data_source.dart';
import '../../data/sources/user_data_source.dart';
import '../dio/app_dio.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Connectivity as singleton
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register UnsplashDio as singleton
  getIt.registerLazySingleton<UnsplashDio>(() => UnsplashDio(connectivity: getIt<Connectivity>()));

  // Register data sources
  getIt.registerLazySingleton<PhotoDataSource>(() => PhotoDataSource(dio: getIt<UnsplashDio>()));
  getIt.registerLazySingleton<UserDataSource>(() => UserDataSource(dio: getIt<UnsplashDio>()));
  getIt.registerLazySingleton<CollectionDataSource>(() => CollectionDataSource(dio: getIt<UnsplashDio>()));
  getIt.registerLazySingleton<SearchDataSource>(() => SearchDataSource(dio: getIt<UnsplashDio>()));

  // Register repositories
  getIt.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(photoDataSource: GetIt.instance<PhotoDataSource>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userDataSource: GetIt.instance<UserDataSource>()),
  );
  getIt.registerLazySingleton<CollectionRepository>(
    () => CollectionRepositoryImpl(collectionDataSource: GetIt.instance<CollectionDataSource>()),
  );
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchDataSource: GetIt.instance<SearchDataSource>()),
  );
}
