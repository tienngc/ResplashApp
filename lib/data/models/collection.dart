import 'package:freezed_annotation/freezed_annotation.dart';
import 'photo.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required String id,
    required String title,
    String? description,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'last_collected_at') required String lastCollectedAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @Default(false) bool featured,
    @JsonKey(name: 'total_photos') @Default(0) int totalPhotos,
    @Default(false) bool private,
    @JsonKey(name: 'share_key') String? shareKey,
    @Default([]) List<CollectionTag> tags,
    required CollectionLinks links,
    required User user,
    @JsonKey(name: 'cover_photo') Photo? coverPhoto,
    @JsonKey(name: 'preview_photos') @Default([]) List<PreviewPhoto> previewPhotos,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

@freezed
class CollectionTag with _$CollectionTag {
  const factory CollectionTag({
    required String type,
    required String title,
  }) = _CollectionTag;

  factory CollectionTag.fromJson(Map<String, dynamic> json) => _$CollectionTagFromJson(json);
}

@freezed
class CollectionLinks with _$CollectionLinks {
  const factory CollectionLinks({
    required String self,
    required String html,
    required String photos,
    required String related,
  }) = _CollectionLinks;

  factory CollectionLinks.fromJson(Map<String, dynamic> json) => _$CollectionLinksFromJson(json);
}

@freezed
class PreviewPhoto with _$PreviewPhoto {
  const factory PreviewPhoto({
    required String id,
    required String slug,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'blur_hash') String? blurHash,
    @JsonKey(name: 'asset_type') @Default('photo') String assetType,
    required PhotoUrls urls,
  }) = _PreviewPhoto;

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => _$PreviewPhotoFromJson(json);
} 