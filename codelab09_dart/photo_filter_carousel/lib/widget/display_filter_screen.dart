import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_carousel.dart';

class DisplayFilterScreen extends StatelessWidget {
  final String imagePath;
  const DisplayFilterScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoFilterCarousel(imagePath: imagePath),
    );
  }
}
