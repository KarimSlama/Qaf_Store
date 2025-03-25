import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_cubit.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_state.dart';
import 'package:qaf_store/features/screens/checkout/data/model/payment_method_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state.selectedPaymentMethod.name.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<CheckoutCubit>().changePaymentMethod(
                  PaymentMethodModel(
                    name: 'PayPal',
                    image: Assets.icons.paymentMethods.paypal.path,
                  ),
                );
          });
        }

        return Column(
          spacing: QafSizes.spaceBtwItems / 2,
          children: [
            SectionHeading(
                text: QafStrings.paymentMethod,
                buttonText: QafStrings.change,
                isActionButton: true,
                onPressed: () {
                  context
                      .read<CheckoutCubit>()
                      .showPaymentMethodSelection(context);
                }),
            if (state.selectedPaymentMethod.name.isNotEmpty)
              Row(
                spacing: QafSizes.spaceBtwItems / 2,
                children: [
                  RoundedContainer(
                    width: 60.w,
                    height: 35.h,
                    padding: EdgeInsetsDirectional.all(QafSizes.sm),
                    backgroundColor: dark ? QafColors.light : QafColors.white,
                    child: Image.asset(
                      state.selectedPaymentMethod.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    state.selectedPaymentMethod.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
