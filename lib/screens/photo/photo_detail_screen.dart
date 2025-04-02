import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:resplash/data/models/photo.dart';
import 'package:resplash/data/repositories/photo_repository.dart';

class PhotoDetailScreen extends StatefulWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  State<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  final PhotoRepository _photoRepository = GetIt.instance<PhotoRepository>();
  bool _isDownloading = false;
  String? _errorMessage;

  Future<void> _trackDownload() async {
    if (_isDownloading) return;

    setState(() {
      _isDownloading = true;
      _errorMessage = null;
    });

    try {
      await _photoRepository.trackPhotoDownload(widget.photo.id);
      // Here you could add download functionality
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Download tracked successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.photo.user.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _trackDownload,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo
          Expanded(
            child: Center(
              child: Hero(
                tag: 'photo_${widget.photo.id}',
                child: Image.network(
                  widget.photo.urls.regular,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.error_outline, size: 48, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Error message if any
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText.rich(
                TextSpan(
                  text: 'Error: $_errorMessage',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),

          // Photo Info
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        widget.photo.user.profileImage.medium,
                      ),
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.photo.user.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.photo.user.username.isNotEmpty)
                          Text(
                            '@${widget.photo.user.username}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Photo description if available
                if (widget.photo.description != null && widget.photo.description!.isNotEmpty)
                  Text(
                    widget.photo.description!,
                    style: const TextStyle(fontSize: 14),
                  ),

                const SizedBox(height: 8),

                // Photo stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStat(Icons.thumb_up, '${widget.photo.likes}', 'Likes'),
                    _buildStat(Icons.download, '${widget.photo.downloads}', 'Downloads'),
                    _buildStat(Icons.color_lens, widget.photo.color, 'Color'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
} 