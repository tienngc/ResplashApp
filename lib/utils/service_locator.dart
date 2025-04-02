import 'package:get_it/get_it.dart';
import 'package:resplash/configs/di/service_locator.dart' as config_di;
import 'package:resplash/data/repositories/collection_repository.dart';
import 'package:resplash/data/repositories/collection_repository_impl.dart';
import 'package:resplash/data/repositories/photo_repository.dart';
import 'package:resplash/data/repositories/photo_repository_impl.dart';
import 'package:resplash/data/repositories/search_repository.dart';
import 'package:resplash/data/repositories/search_repository_impl.dart';
import 'package:resplash/data/repositories/user_repository.dart';
import 'package:resplash/data/repositories/user_repository_impl.dart';
import 'package:resplash/data/sources/collection_data_source.dart';
import 'package:resplash/data/sources/photo_data_source.dart';
import 'package:resplash/data/sources/search_data_source.dart';
import 'package:resplash/data/sources/user_data_source.dart';

void setupServiceLocator() {
  // Set up the configs DI
  config_di.setupServiceLocator();
  
  // Register all repositories
  GetIt.instance.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(photoDataSource: GetIt.instance<PhotoDataSource>()),
  );
  
  GetIt.instance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userDataSource: GetIt.instance<UserDataSource>()),
  );
  
  GetIt.instance.registerLazySingleton<CollectionRepository>(
    () => CollectionRepositoryImpl(collectionDataSource: GetIt.instance<CollectionDataSource>()),
  );
  
  GetIt.instance.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchDataSource: GetIt.instance<SearchDataSource>()),
  );
} 