import 'package:resplash/configs/dio/app_dio.dart';
import 'package:resplash/data/sources/base_data_source.dart';

class SearchDataSource extends BaseDataSource {
  SearchDataSource({required UnsplashDio dio}) : super(dio: dio);

  /// Search photos
  Future<dynamic> searchPhotos({
    required String query,
    int? page,
    int? perPage,
    String? orderBy,
    String? contentFilter,
    String? color,
    String? orientation,
  }) async {
    final queryParameters = {
      'query': query,
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (orderBy != null) 'order_by': orderBy,
      if (contentFilter != null) 'content_filter': contentFilter,
      if (color != null) 'color': color,
      if (orientation != null) 'orientation': orientation,
    };

    return await get('/search/photos', queryParameters: queryParameters);
  }

  /// Search collections
  Future<dynamic> searchCollections({
    required String query,
    int? page,
    int? perPage,
  }) async {
    final queryParameters = {
      'query': query,
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    return await get('/search/collections', queryParameters: queryParameters);
  }

  /// Search users
  Future<dynamic> searchUsers({
    required String query,
    int? page,
    int? perPage,
  }) async {
    final queryParameters = {
      'query': query,
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    return await get('/search/users', queryParameters: queryParameters);
  }
} 