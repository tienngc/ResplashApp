import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:resplash/data/unsplash_rest_api.dart';

import '../dio/app_dio.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final connectivity = Connectivity();
  final appDio = UnsplashDio(connectivity: connectivity);

  getIt.registerLazySingleton<UnsplashRestApi>(() => UnsplashRestApi(appDio.dio));
}
