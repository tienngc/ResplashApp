import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptor extends Interceptor {
  final Connectivity _connectivity;

  ConnectivityInterceptor({required Connectivity connectivity})
      : _connectivity = connectivity;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return handler.reject(DioException(
          requestOptions: err.requestOptions, message: 'No internet connection'));
    }
    return handler.next(err);
  }
}