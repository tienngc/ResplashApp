import 'package:dio/dio.dart';
import 'package:resplash/data/models/collection.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:retrofit/retrofit.dart';

part 'unsplash_rest_api.g.dart';

@RestApi()
abstract class UnsplashRestApi {
  factory UnsplashRestApi(Dio dio) = _UnsplashRestApi;

  @GET('/photos')
  Future<List<Photo>> getPhotos(
    @Query("page") int page,
    @Query("per_page") int perPage,
  );

  @GET('/photos/{id}')
  Future<Photo> getPhoto(@Path("id") String id);

  @GET('/collections')
  Future<List<Collection>> getCollections(
    @Query("page") int page,
    @Query("per_page") int perPage,
  );
}
