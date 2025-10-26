import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              'https://images.unsplash.com/photo-1557682224-5b8590cd9ec5?auto=format&fit=crop&w=400&q=80',
              fit: BoxFit.cover,
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
              // Show a loading indicator while the image is loading
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              // If the image fails to load (e.g., network blocked on device),
              // show a black background with a red broken-image icon.
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.black,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}