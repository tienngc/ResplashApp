import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/utils/ui_utils.dart';

class PhotoItemWidget extends StatelessWidget {
  final Photo photo;

  const PhotoItemWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(imageUrl: photo.user.profileImage.small),
              ),
              SizedBox(width: 16),
              Text(photo.user.name),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: CachedNetworkImage(
              imageUrl: photo.urls.full,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, string) {
                return Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: UiUtils.fromHex(photo.color),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
