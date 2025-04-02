import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/collection_repository.dart';
import 'package:resplash/data/sources/collection_data_source.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionDataSource _collectionDataSource;

  CollectionRepositoryImpl({required CollectionDataSource collectionDataSource})
      : _collectionDataSource = collectionDataSource;

  @override
  Future<List<Collection>> getCollections({
    int? page,
    int? perPage,
  }) async {
    try {
      final data = await _collectionDataSource.getCollections(
        page: page,
        perPage: perPage,
      );

      if (data is List) {
        return data.map((json) => Collection.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load collections: $e');
    }
  }

  @override
  Future<Collection> getCollection(String id) async {
    try {
      final data = await _collectionDataSource.getCollection(id);
      return Collection.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load collection: $e');
    }
  }

  @override
  Future<List<Photo>> getCollectionPhotos({
    required String id,
    int? page,
    int? perPage,
    String? orientation,
  }) async {
    try {
      final data = await _collectionDataSource.getCollectionPhotos(
        id: id,
        page: page,
        perPage: perPage,
        orientation: orientation,
      );

      if (data is List) {
        return data.map((json) => Photo.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load collection photos: $e');
    }
  }

  @override
  Future<List<Collection>> getRelatedCollections(String id) async {
    try {
      final data = await _collectionDataSource.getRelatedCollections(id);

      if (data is List) {
        return data.map((json) => Collection.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load related collections: $e');
    }
  }

  @override
  Future<Collection> createCollection({
    required String title,
    String? description,
    bool? private,
  }) async {
    try {
      final data = await _collectionDataSource.createCollection(
        title: title,
        description: description,
        private: private,
      );
      
      return Collection.fromJson(data);
    } catch (e) {
      throw Exception('Failed to create collection: $e');
    }
  }

  @override
  Future<Collection> updateCollection({
    required String id,
    String? title,
    String? description,
    bool? private,
  }) async {
    try {
      final data = await _collectionDataSource.updateCollection(
        id: id,
        title: title,
        description: description,
        private: private,
      );
      
      return Collection.fromJson(data);
    } catch (e) {
      throw Exception('Failed to update collection: $e');
    }
  }

  @override
  Future<void> deleteCollection(String id) async {
    try {
      await _collectionDataSource.deleteCollection(id);
    } catch (e) {
      throw Exception('Failed to delete collection: $e');
    }
  }

  @override
  Future<void> addPhotoToCollection({
    required String collectionId,
    required String photoId,
  }) async {
    try {
      await _collectionDataSource.addPhotoToCollection(
        collectionId: collectionId,
        photoId: photoId,
      );
    } catch (e) {
      throw Exception('Failed to add photo to collection: $e');
    }
  }

  @override
  Future<void> removePhotoFromCollection({
    required String collectionId,
    required String photoId,
  }) async {
    try {
      await _collectionDataSource.removePhotoFromCollection(
        collectionId: collectionId,
        photoId: photoId,
      );
    } catch (e) {
      throw Exception('Failed to remove photo from collection: $e');
    }
  }
} 