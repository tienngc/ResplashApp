import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../env_config.dart';
import 'connectivity_interceptor.dart';
import 'logging_interceptor.dart';

export 'connectivity_interceptor.dart';
export 'logging_interceptor.dart';

abstract class AppDio {
  Dio? _dio;

  Dio get dio {
    _dio ??= _get();
    return _dio!;
  }

  Dio _get();
}

class UnsplashDio extends AppDio {
  final int _connectTimeout = 60000;
  final int _receiveTimeout = 60000;
  final Connectivity _connectivity;

  UnsplashDio({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  @override
  Dio _get() {
    return Dio()
      ..options = BaseOptions(
        baseUrl: EnvConfig.unsplashBaseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Client-ID ${EnvConfig.unsplashApiKey}',
        },
        connectTimeout: Duration(milliseconds: _connectTimeout),
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
      )
      ..interceptors.addAll([
        LoggingInterceptor(),
        ConnectivityInterceptor(
          connectivity: _connectivity,
        ),
      ]);
  }
}