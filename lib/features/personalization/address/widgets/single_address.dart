import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class SingleAddress extends StatelessWidget {
  final bool isSelectedAddress;
  const SingleAddress({super.key, required this.isSelectedAddress});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return RoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: EdgeInsetsDirectional.all(QafSizes.md),
      backgroundColor: isSelectedAddress
          ? QafColors.primary.withValues(alpha: .5)
          : Colors.transparent,
      borderColor: isSelectedAddress
          ? Colors.transparent
          : dark
              ? QafColors.darkerGrey
              : QafColors.grey,
      margin: EdgeInsetsDirectional.only(bottom: QafSizes.spaceBtwItems),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            end: 5,
            child: Icon(isSelectedAddress ? Iconsax.tick_circle5 : null,
                color: isSelectedAddress
                    ? dark
                        ? QafColors.light
                        : QafColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: QafSizes.sm / 2,
            children: [
              Text(
                'Karim Slama',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('+20 1095856941',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              Text('56 St., Cairo, Egypt', maxLines: 1, softWrap: true)
            ],
          )
        ],
      ),
    );
  }
}
