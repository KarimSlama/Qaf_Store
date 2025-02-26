import 'package:flutter/material.dart';
import 'package:qaf_store/features/store/screens/product_reivews/widgets/rating_progress_indicator.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.9', style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 7,
          child: Column(
            spacing: QafSizes.xs,
            children: [
              RatingProgressIndicator(text: '20', value: 1),
              RatingProgressIndicator(text: '15', value: .8),
              RatingProgressIndicator(text: '10', value: .6),
              RatingProgressIndicator(text: '5', value: .4),
              RatingProgressIndicator(text: '1', value: .2),
            ],
          ),
        )
      ],
    );
  }
}
