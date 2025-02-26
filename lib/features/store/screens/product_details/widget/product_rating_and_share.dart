import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class ProductRatingAndShare extends StatelessWidget {
  const ProductRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            Icon(Iconsax.star5, color: Colors.amber),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '4.9 ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: '[200]'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
        ),
      ],
    );
  }
}
