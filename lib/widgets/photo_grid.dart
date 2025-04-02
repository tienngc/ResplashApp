import 'package:flutter/material.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/widgets/photo_card.dart';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;
  final ScrollController scrollController;
  final bool isLoading;
  final int crossAxisCount;

  const PhotoGrid({
    super.key,
    required this.photos,
    required this.scrollController,
    this.isLoading = false,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.75, // Adjust as needed for photo aspect ratio
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: photos.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == photos.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return PhotoCard(photo: photos[index]);
      },
    );
  }
} 