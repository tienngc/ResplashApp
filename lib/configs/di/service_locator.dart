import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../dio/app_dio.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Connectivity as singleton
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register UnsplashDio as singleton
  getIt.registerLazySingleton<UnsplashDio>(() => UnsplashDio(connectivity: getIt<Connectivity>()));
}
