import 'package:resplash/configs/dio/app_dio.dart';
import 'package:resplash/data/sources/base_data_source.dart';

class PhotoDataSource extends BaseDataSource {
  PhotoDataSource({required UnsplashDio dio}) : super(dio: dio);

  /// Get a list of photos
  Future<dynamic> getPhotos({
    int? page,
    int? perPage,
    String? orderBy,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (orderBy != null) 'order_by': orderBy,
    };

    return await get('/photos', queryParameters: queryParameters);
  }

  /// Get a single photo
  Future<dynamic> getPhoto(String id) async {
    return await get('/photos/$id');
  }

  /// Get a random photo
  Future<dynamic> getRandomPhotos({
    String? query,
    String? orientation,
    String? contentFilter,
    int? count,
  }) async {
    final queryParameters = {
      if (query != null) 'query': query,
      if (orientation != null) 'orientation': orientation,
      if (contentFilter != null) 'content_filter': contentFilter,
      if (count != null) 'count': count,
    };

    return await get('/photos/random', queryParameters: queryParameters);
  }

  /// Search for photos
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

  /// Get a photo's statistics
  Future<dynamic> getPhotoStats({
    required String id,
    String? resolution,
    int? quantity,
  }) async {
    final queryParameters = {
      if (resolution != null) 'resolution': resolution,
      if (quantity != null) 'quantity': quantity,
    };

    return await get('/photos/$id/statistics', queryParameters: queryParameters);
  }

  /// Track a photo download
  Future<dynamic> trackPhotoDownload(String id) async {
    return await get('/photos/$id/download');
  }

  /// Like a photo
  Future<dynamic> likePhoto(String id) async {
    return await post('/photos/$id/like');
  }

  /// Unlike a photo
  Future<dynamic> unlikePhoto(String id) async {
    return await delete('/photos/$id/like');
  }
} 