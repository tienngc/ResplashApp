import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required String id,
    required int width,
    required int height,
    required String color,
    required PhotoUrls urls,
    required PhotoLinks links,
    @Default(0) int likes,
    required User user,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class PhotoUrls with _$PhotoUrls {
  const factory PhotoUrls({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
    @JsonKey(name: 'small_s3') String? smallS3,
  }) = _PhotoUrls;

  factory PhotoUrls.fromJson(Map<String, dynamic> json) => _$PhotoUrlsFromJson(json);
}

@freezed
class PhotoLinks with _$PhotoLinks {
  const factory PhotoLinks({
    required String self,
    required String html,
    required String download,
    @JsonKey(name: 'download_location') required String downloadLocation,
  }) = _PhotoLinks;

  factory PhotoLinks.fromJson(Map<String, dynamic> json) => _$PhotoLinksFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String name,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'twitter_username') String? twitterUsername,
    @JsonKey(name: 'portfolio_url') String? portfolioUrl,
    String? bio,
    String? location,
    required UserLinks links,
    @JsonKey(name: 'profile_image') required UserProfileImage profileImage,
    @JsonKey(name: 'instagram_username') String? instagramUsername,
    @JsonKey(name: 'total_collections') @Default(0) int totalCollections,
    @JsonKey(name: 'total_likes') @Default(0) int totalLikes,
    @JsonKey(name: 'total_photos') @Default(0) int totalPhotos,
    @JsonKey(name: 'total_promoted_photos') @Default(0) int totalPromotedPhotos,
    @JsonKey(name: 'total_illustrations') @Default(0) int totalIllustrations,
    @JsonKey(name: 'total_promoted_illustrations') @Default(0) int totalPromotedIllustrations,
    @JsonKey(name: 'accepted_tos') @Default(false) bool acceptedTos,
    @JsonKey(name: 'for_hire') @Default(false) bool forHire,
    UserSocial? social,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
class UserProfileImage with _$UserProfileImage {
  const factory UserProfileImage({
    required String small,
    required String medium,
    required String large,
  }) = _UserProfileImage;

  factory UserProfileImage.fromJson(Map<String, dynamic> json) => _$UserProfileImageFromJson(json);
}

@freezed
class UserSocial with _$UserSocial {
  const factory UserSocial({
    @JsonKey(name: 'instagram_username') String? instagramUsername,
    @JsonKey(name: 'portfolio_url') String? portfolioUrl,
    @JsonKey(name: 'twitter_username') String? twitterUsername,
    @JsonKey(name: 'paypal_email') String? paypalEmail,
  }) = _UserSocial;

  factory UserSocial.fromJson(Map<String, dynamic> json) => _$UserSocialFromJson(json);
}
