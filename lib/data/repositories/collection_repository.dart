import 'package:resplash/data/models/photo.dart';

abstract class CollectionRepository {
  /// List collections
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  Future<List<Collection>> getCollections({
    int? page,
    int? perPage,
  });

  /// Get a collection
  /// [id] - The collection's ID
  Future<Collection> getCollection(String id);

  /// Get a collection's photos
  /// [id] - The collection's ID
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orientation] - Filter by photo orientation (Optional; Valid values: landscape, portrait, squarish)
  Future<List<Photo>> getCollectionPhotos({
    required String id,
    int? page,
    int? perPage,
    String? orientation,
  });

  /// List a collection's related collections
  /// [id] - The collection's ID
  Future<List<Collection>> getRelatedCollections(String id);

  /// Create a new collection
  /// [title] - The title of the collection (Required)
  /// [description] - The collection's description
  /// [private] - Whether to make the collection private (Optional; default: false)
  Future<Collection> createCollection({
    required String title,
    String? description,
    bool? private,
  });

  /// Update an existing collection
  /// [id] - The collection's ID
  /// [title] - The title of the collection
  /// [description] - The collection's description
  /// [private] - Whether to make the collection private
  Future<Collection> updateCollection({
    required String id,
    String? title,
    String? description,
    bool? private,
  });

  /// Delete a collection
  /// [id] - The collection's ID
  Future<void> deleteCollection(String id);

  /// Add a photo to a collection
  /// [collectionId] - The collection's ID
  /// [photoId] - The photo's ID
  Future<void> addPhotoToCollection({
    required String collectionId,
    required String photoId,
  });

  /// Remove a photo from a collection
  /// [collectionId] - The collection's ID
  /// [photoId] - The photo's ID
  Future<void> removePhotoFromCollection({
    required String collectionId,
    required String photoId,
  });
} 