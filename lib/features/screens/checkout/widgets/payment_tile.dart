import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_cubit.dart';
import 'package:qaf_store/features/screens/checkout/data/model/payment_method_model.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class PaymentTile extends StatelessWidget {
  final PaymentMethodModel paymentMethodModel;
  const PaymentTile({super.key, required this.paymentMethodModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CheckoutCubit>(),
      child:   ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => context.pop(paymentMethodModel: paymentMethodModel),
            leading: RoundedContainer(
              width: 60.w,
              height: 40.h,
              backgroundColor: QafHelperFunctions.isDark(context)
                  ? QafColors.light
                  : QafColors.light,
              padding: EdgeInsetsDirectional.all(QafSizes.sm),
              child: Image(
                  image: AssetImage(paymentMethodModel.image),
                  fit: BoxFit.contain),
            ),
            title: Text(paymentMethodModel.name),
            trailing: const Icon(Iconsax.arrow_right_24),
          )
        
    );
  }
}
