import 'package:resplash/data/models/photo.dart';

abstract class PhotoRepository {
  /// Get a list of photos
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orderBy] - How to sort the photos (Optional; Valid values: latest, oldest, popular; default: latest)
  Future<List<Photo>> getPhotos({
    int? page,
    int? perPage,
    String? orderBy,
  });

  /// Get a single photo
  /// [id] - The photo's ID
  Future<Photo> getPhoto(String id);

  /// Get a random photo
  /// [query] - Limit selection to photos matching a search term
  /// [orientation] - Filter by photo orientation (landscape, portrait, squarish)
  /// [contentFilter] - Limit results by content safety (low, high)
  /// [count] - The number of photos to return (default: 1; max: 30)
  Future<List<Photo>> getRandomPhotos({
    String? query,
    String? orientation,
    String? contentFilter,
    int? count,
  });

  /// Search for photos
  /// [query] - Search terms
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orderBy] - How to sort the photos (Optional; Valid values: relevant, latest; default: relevant)
  /// [contentFilter] - Limit results by content safety (low, high)
  /// [color] - Filter by color (black_and_white, black, white, yellow, orange, red, green, teal, blue)
  /// [orientation] - Filter by photo orientation (landscape, portrait, squarish)
  Future<List<Photo>> searchPhotos({
    required String query,
    int? page,
    int? perPage,
    String? orderBy,
    String? contentFilter,
    String? color,
    String? orientation,
  });

  /// Get a photo's statistics
  /// [id] - The photo's ID
  /// [resolution] - The frequency of the stats (days)
  /// [quantity] - The amount of for each stat (default: 30)
  Future<Map<String, dynamic>> getPhotoStats({
    required String id,
    String? resolution,
    int? quantity,
  });

  /// Track a photo download
  /// [id] - The photo's ID
  Future<void> trackPhotoDownload(String id);
} 