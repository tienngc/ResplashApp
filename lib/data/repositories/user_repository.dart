import 'package:resplash/data/models/photo.dart';

abstract class UserRepository {
  /// Get a user's public profile
  /// [username] - The user's username
  Future<User> getUserProfile(String username);

  /// Get a user's portfolio link
  /// [username] - The user's username
  Future<String> getUserPortfolioLink(String username);

  /// List a user's photos
  /// [username] - The user's username
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orderBy] - How to sort the photos (Optional; Valid values: latest, oldest, popular; default: latest)
  /// [stats] - Show the stats for each user's photo (Optional; default: false)
  /// [orientation] - Filter by photo orientation (Optional; Valid values: landscape, portrait, squarish)
  Future<List<Photo>> getUserPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    bool? stats,
    String? orientation,
  });

  /// List a user's liked photos
  /// [username] - The user's username
  /// [page] - Page number to retrieve (Optional; default: 1)
  /// [perPage] - Number of items per page (Optional; default: 10)
  /// [orderBy] - How to sort the photos (Optional; Valid values: latest, oldest, popular; default: latest)
  /// [orientation] - Filter by photo orientation (Optional; Valid values: landscape, portrait, squarish)
  Future<List<Photo>> getUserLikedPhotos({
    required String username,
    int? page,
    int? perPage,
    String? orderBy,
    String? orientation,
  });

  /// Get a user's statistics
  /// [username] - The user's username
  /// [resolution] - The frequency of the stats (Optional; default: days)
  /// [quantity] - The amount of each stat to retrieve (Optional; default: 30)
  Future<Map<String, dynamic>> getUserStatistics({
    required String username,
    String? resolution,
    int? quantity,
  });
} 