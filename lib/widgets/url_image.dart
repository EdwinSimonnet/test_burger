import 'package:flutter/material.dart';
import 'package:test_burger/constants.dart';
import 'package:test_burger/widgets/rounded_display.dart';

// Widget affichant une image url
// Image par défaut si url nulle ou 404
// dimension à préciser ou par défaut
class UrlImage extends StatelessWidget {
  final String? url;
  final double dimension;

  const UrlImage({super.key, this.url, this.dimension = 200});

  @override
  Widget build(BuildContext context) {
    Image defaultImage = Image.asset(
      logoPath,
      width: dimension,
    );

    return RoundedDisplay(
        child: url == null
            ? defaultImage
            : Image.network(url!, width: dimension, height: dimension, fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return defaultImage;
              }));
  }
}
