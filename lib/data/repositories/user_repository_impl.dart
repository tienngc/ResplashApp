import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/user_repository.dart';
import 'package:resplash/data/sources/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  @override
  Future<User> getUserProfile(String username) async {
    try {
      final data = await _userDataSource.getUserProfile(username);
      return User.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    }
  }

  @override
  Future<String> getUserPortfolioLink(String username) async {
    try {
      final data = await _userDataSource.getUserPortfolioLink(username);
      return data['url'];
    } catch (e) {
      throw Exception('Failed to load user portfolio link: $e');
    }
  }

  @override
  Future<List<Photo>> getUserPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    bool? stats,
    String? orientation,
  }) async {
    try {
      final data = await _userDataSource.getUserPhotos(
        username: username,
        page: page,
        perPage: perPage,
        orderBy: orderBy,
        stats: stats,
        orientation: orientation,
      );

      if (data is List) {
        return data.map((json) => Photo.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load user photos: $e');
    }
  }

  @override
  Future<List<Photo>> getUserLikedPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    String? orientation,
  }) async {
    try {
      final data = await _userDataSource.getUserLikedPhotos(
        username: username,
        page: page,
        perPage: perPage,
        orderBy: orderBy,
        orientation: orientation,
      );

      if (data is List) {
        return data.map((json) => Photo.fromJson(json)).toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to load user liked photos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getUserStatistics({
    required String username,
    String? resolution,
    int? quantity,
  }) async {
    try {
      return await _userDataSource.getUserStatistics(
        username: username,
        resolution: resolution,
        quantity: quantity,
      );
    } catch (e) {
      throw Exception('Failed to load user statistics: $e');
    }
  }
} 