import 'package:resplash/configs/dio/app_dio.dart';
import 'package:resplash/data/sources/base_data_source.dart';

class UserDataSource extends BaseDataSource {
  UserDataSource({required UnsplashDio dio}) : super(dio: dio);

  /// Get a user's public profile
  Future<dynamic> getUserProfile(String username) async {
    return await get('/users/$username');
  }

  /// Get a user's portfolio link
  Future<dynamic> getUserPortfolioLink(String username) async {
    return await get('/users/$username/portfolio');
  }

  /// List a user's photos
  Future<dynamic> getUserPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    bool? stats,
    String? orientation,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (orderBy != null) 'order_by': orderBy,
      if (stats != null) 'stats': stats,
      if (orientation != null) 'orientation': orientation,
    };

    return await get('/users/$username/photos', queryParameters: queryParameters);
  }

  /// List a user's liked photos
  Future<dynamic> getUserLikedPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    String? orientation,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (orderBy != null) 'order_by': orderBy,
      if (orientation != null) 'orientation': orientation,
    };

    return await get('/users/$username/likes', queryParameters: queryParameters);
  }

  /// Get a user's collections
  Future<dynamic> getUserCollections({
    required String username,
    int? page,
    int? perPage,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    return await get('/users/$username/collections', queryParameters: queryParameters);
  }

  /// Get a user's statistics
  Future<dynamic> getUserStatistics({
    required String username,
    String? resolution,
    int? quantity,
  }) async {
    final queryParameters = {
      if (resolution != null) 'resolution': resolution,
      if (quantity != null) 'quantity': quantity,
    };

    return await get('/users/$username/statistics', queryParameters: queryParameters);
  }
} 