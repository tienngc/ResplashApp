import 'package:resplash/data/models/photo.dart';

abstract class SearchRepository {
  /// Search photos
  /// [query] - Search terms
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orderBy] - How to sort the photos (Optional; Valid values: relevant, latest; default: relevant)
  /// [contentFilter] - Limit results by content safety (low, high)
  /// [color] - Filter by color (black_and_white, black, white, yellow, orange, red, green, teal, blue)
  /// [orientation] - Filter by photo orientation (landscape, portrait, squarish)
  Future<Map<String, dynamic>> searchPhotos({
    required String query,
    int? page,
    int? perPage,
    String? orderBy,
    String? contentFilter,
    String? color,
    String? orientation,
  });

  /// Search collections
  /// [query] - Search terms
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  Future<Map<String, dynamic>> searchCollections({
    required String query,
    int? page,
    int? perPage,
  });

  /// Search users
  /// [query] - Search terms
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  Future<Map<String, dynamic>> searchUsers({
    required String query,
    int? page,
    int? perPage,
  });
} 