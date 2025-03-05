import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/products/rating_bar.dart';
import 'package:qaf_store/features/screens/product_reivews/widgets/overall_product_rating.dart';
import 'package:qaf_store/features/screens/product_reivews/widgets/user_review_card.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.ratingReviews),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QafStrings
                  .ratingsAndReviewsAreVerifiedAndFromPeopleWhoUseTheSameTypeOfDeviceThatYouUse),
              OverallProductRating(),
              QafRatingBarIndicator(rating: 4.5),
              Text('12, 348', style: Theme.of(context).textTheme.bodySmall),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
