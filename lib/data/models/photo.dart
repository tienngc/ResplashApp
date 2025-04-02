import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required String id,
    required String createdAt,
    required String updatedAt,
    required int width,
    required int height,
    required String color,
    required String blurHash,
    required int downloads,
    required int likes,
    required bool likedByUser,
    String? description,
    required User user,
    required PhotoUrls urls,
    required PhotoLinks links,
    @Default([]) List<Collection> currentUserCollections,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String name,
    String? portfolioUrl,
    String? bio,
    String? location,
    required int totalLikes,
    required int totalPhotos,
    required int totalCollections,
    String? instagramUsername,
    String? twitterUsername,
    required UserProfileImage profileImage,
    required UserLinks links,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserProfileImage with _$UserProfileImage {
  const factory UserProfileImage({
    required String small,
    required String medium,
    required String large,
  }) = _UserProfileImage;

  factory UserProfileImage.fromJson(Map<String, dynamic> json) => _$UserProfileImageFromJson(json);
}

@freezed
class UserLinks with _$UserLinks {
  const factory UserLinks({
    required String self,
    required String html,
    required String photos,
    required String likes,
    required String portfolio,
  }) = _UserLinks;

  factory UserLinks.fromJson(Map<String, dynamic> json) => _$UserLinksFromJson(json);
}

@freezed
class PhotoUrls with _$PhotoUrls {
  const factory PhotoUrls({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _PhotoUrls;

  factory PhotoUrls.fromJson(Map<String, dynamic> json) => _$PhotoUrlsFromJson(json);
}

@freezed
class PhotoLinks with _$PhotoLinks {
  const factory PhotoLinks({
    required String self,
    required String html,
    required String download,
    required String downloadLocation,
  }) = _PhotoLinks;

  factory PhotoLinks.fromJson(Map<String, dynamic> json) => _$PhotoLinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    required int id,
    required String title,
    required String publishedAt,
    required String lastCollectedAt,
    required String updatedAt,
    required bool featured,
    required int totalPhotos,
    required bool private,
    required String shareKey,
    required List<String> tags,
    required CollectionMeta meta,
    required String description,
    required String coverPhoto,
    required List<String> previewPhotos,
    required User user,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

@freezed
class CollectionMeta with _$CollectionMeta {
  const factory CollectionMeta({
    required String title,
    required String description,
    required String index,
  }) = _CollectionMeta;

  factory CollectionMeta.fromJson(Map<String, dynamic> json) => _$CollectionMetaFromJson(json);
}
