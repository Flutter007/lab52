import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 250,
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: theme.colorScheme.inverseSurface, width: 4),
      ),
    );
  }
}
