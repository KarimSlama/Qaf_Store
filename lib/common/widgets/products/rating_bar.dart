import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class QafRatingBarIndicator extends StatelessWidget {
  final double rating;
  const QafRatingBarIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) => Icon(Iconsax.star1, color: QafColors.primary),
      rating: rating,
      itemSize: 20,
      unratedColor: QafColors.grey,
    );
  }
}
