import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/photo_repository.dart';
import 'package:resplash/data/sources/photo_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({required PhotoDataSource photoDataSource}) 
      : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos({
    int? page,
    int? perPage,
    String? orderBy,
  }) async {
    try {
      final data = await _photoDataSource.getPhotos(
        page: page,
        perPage: perPage,
        orderBy: orderBy,
      );

      if (data is List) {
        return data.map((json) => Photo.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }

  @override
  Future<Photo> getPhoto(String id) async {
    try {
      final data = await _photoDataSource.getPhoto(id);
      return Photo.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load photo: $e');
    }
  }

  @override
  Future<List<Photo>> getRandomPhotos({
    String? query,
    String? orientation,
    String? contentFilter,
    int? count,
  }) async {
    try {
      final data = await _photoDataSource.getRandomPhotos(
        query: query,
        orientation: orientation,
        contentFilter: contentFilter,
        count: count,
      );

      if (data is List) {
        return data.map((json) => Photo.fromJson(json)).toList();
      } else if (count == null || count == 1) {
        // If a single random photo is returned (not in an array)
        return [Photo.fromJson(data)];
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load random photos: $e');
    }
  }

  @override
  Future<List<Photo>> searchPhotos({
    required String query,
    int? page,
    int? perPage,
    String? orderBy,
    String? contentFilter,
    String? color,
    String? orientation,
  }) async {
    try {
      final data = await _photoDataSource.searchPhotos(
        query: query,
        page: page,
        perPage: perPage,
        orderBy: orderBy,
        contentFilter: contentFilter,
        color: color,
        orientation: orientation,
      );

      if (data is Map && data.containsKey('results')) {
        final List<dynamic> results = data['results'];
        return results.map((json) => Photo.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to search photos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getPhotoStats({
    required String id,
    String? resolution,
    int? quantity,
  }) async {
    try {
      return await _photoDataSource.getPhotoStats(
        id: id,
        resolution: resolution,
        quantity: quantity,
      );
    } catch (e) {
      throw Exception('Failed to load photo stats: $e');
    }
  }

  @override
  Future<void> trackPhotoDownload(String id) async {
    try {
      await _photoDataSource.trackPhotoDownload(id);
    } catch (e) {
      throw Exception('Failed to track photo download: $e');
    }
  }
} 