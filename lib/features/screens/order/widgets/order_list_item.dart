import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/loaders/animation_loader.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_cubit.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => QafShimmerEffect(width: 200, height: 200),
          success: (orders) => ListView.separated(
            separatorBuilder: (_, __) =>
                SizedBox(height: QafSizes.spaceBtwItems),
            itemCount: orders.length,
            itemBuilder: (_, index) => RoundedContainer(
              showBorder: true,
              padding: EdgeInsetsDirectional.all(QafSizes.md),
              backgroundColor: dark ? QafColors.dark : QafColors.light,
              child: Column(
                spacing: QafSizes.spaceBtwItems / 2,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    spacing: QafSizes.spaceBtwItems / 2,
                    children: [
                      Icon(Iconsax.ship),
                      Expanded(
                        child: Column(
                          spacing: QafSizes.xs,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orders[index].orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: QafColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(orders[index].formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      Icon(Iconsax.arrow_right_34, size: QafSizes.iconSm),
                    ],
                  ),
                  Row(
                    spacing: QafSizes.spaceBtwItems / 2,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: QafSizes.spaceBtwItems / 2,
                          children: [
                            Icon(Iconsax.tag),
                            Expanded(
                              child: Column(
                                spacing: QafSizes.xs,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    QafStrings.order,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(orders[index].id,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          spacing: QafSizes.spaceBtwItems / 2,
                          children: [
                            Icon(Iconsax.calendar),
                            Expanded(
                              child: Column(
                                spacing: QafSizes.xs,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    QafStrings.shippingDate,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(orders[index].formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          error: (error) => Text(error),
          orElse: () => AnimationLoaderWidget(
            text: 'No Orders yet!',
            animation:
                Assets.images.animations.orderCompleteCarDeliveryAnimation,
            actionText: 'Let\'s make an order now!',
            showAction: true,
            onActionPressed: () => context.pushNamed(Routes.navigationMenu),
          ),
        );
      },
    );
  }
}
