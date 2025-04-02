import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resplash/data/repositories/search_repository.dart';
import 'package:resplash/data/sources/search_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  SearchRepositoryImpl({required SearchDataSource searchDataSource})
      : _searchDataSource = searchDataSource;

  @override
  Future<Map<String, dynamic>> searchPhotos({
    required String query,
    int? page,
    int? perPage,
    String? orderBy,
    String? contentFilter,
    String? color,
    String? orientation,
  }) async {
    try {
      return await _searchDataSource.searchPhotos(
        query: query,
        page: page,
        perPage: perPage,
        orderBy: orderBy,
        contentFilter: contentFilter,
        color: color,
        orientation: orientation,
      );
    } catch (e) {
      throw Exception('Failed to search photos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> searchCollections({
    required String query,
    int? page,
    int? perPage,
  }) async {
    try {
      return await _searchDataSource.searchCollections(
        query: query,
        page: page,
        perPage: perPage,
      );
    } catch (e) {
      throw Exception('Failed to search collections: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> searchUsers({
    required String query,
    int? page,
    int? perPage,
  }) async {
    try {
      return await _searchDataSource.searchUsers(
        query: query,
        page: page,
        perPage: perPage,
      );
    } catch (e) {
      throw Exception('Failed to search users: $e');
    }
  }
} 