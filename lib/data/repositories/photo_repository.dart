import 'package:resplash/data/unsplash_rest_api.dart';

import '../models/photo.dart';

abstract interface class PhotoRepository {
  Future<Photo> getPhotoById(String id);
  Future<List<Photo>> getPhotos({required int page, int perPage});
}

class PhotoRepositoryImpl extends PhotoRepository {
  final UnsplashRestApi _api;

  PhotoRepositoryImpl(UnsplashRestApi api) : _api = api;

  @override
  Future<Photo> getPhotoById(String id) async {
    return _api.getPhoto(id);
  }

  @override
  Future<List<Photo>> getPhotos({required int page, int perPage = 30}) async {
    return _api.getPhotos(page, perPage);
  }
}
