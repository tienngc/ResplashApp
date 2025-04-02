import 'package:resplash/configs/dio/app_dio.dart';
import 'package:resplash/data/sources/base_data_source.dart';

class CollectionDataSource extends BaseDataSource {
  CollectionDataSource({required UnsplashDio dio}) : super(dio: dio);

  /// List collections
  Future<dynamic> getCollections({
    int? page,
    int? perPage,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    return await get('/collections', queryParameters: queryParameters);
  }

  /// Get a collection
  Future<dynamic> getCollection(String id) async {
    return await get('/collections/$id');
  }

  /// Get a collection's photos
  Future<dynamic> getCollectionPhotos({
    required String id,
    int? page,
    int? perPage,
    String? orientation,
  }) async {
    final queryParameters = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (orientation != null) 'orientation': orientation,
    };

    return await get('/collections/$id/photos', queryParameters: queryParameters);
  }

  /// List a collection's related collections
  Future<dynamic> getRelatedCollections(String id) async {
    return await get('/collections/$id/related');
  }

  /// Create a new collection
  Future<dynamic> createCollection({
    required String title,
    String? description,
    bool? private,
  }) async {
    final data = {
      'title': title,
      if (description != null) 'description': description,
      if (private != null) 'private': private,
    };

    return await post('/collections', data: data);
  }

  /// Update an existing collection
  Future<dynamic> updateCollection({
    required String id,
    String? title,
    String? description,
    bool? private,
  }) async {
    final data = {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (private != null) 'private': private,
    };

    return await put('/collections/$id', data: data);
  }

  /// Delete a collection
  Future<dynamic> deleteCollection(String id) async {
    return await delete('/collections/$id');
  }

  /// Add a photo to a collection
  Future<dynamic> addPhotoToCollection({
    required String collectionId,
    required String photoId,
  }) async {
    final data = {'photo_id': photoId};
    return await post('/collections/$collectionId/add', data: data);
  }

  /// Remove a photo from a collection
  Future<dynamic> removePhotoFromCollection({
    required String collectionId,
    required String photoId,
  }) async {
    final data = {'photo_id': photoId};
    return await delete('/collections/$collectionId/remove', data: data);
  }
} 