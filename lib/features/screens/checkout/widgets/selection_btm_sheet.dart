import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/features/screens/address/widgets/single_address.dart';
import 'package:qaf_store/features/screens/checkout/data/model/payment_method_model.dart';
import 'package:qaf_store/features/screens/checkout/widgets/payment_tile.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class SelectionBottomSheet {
  static Future<PaymentMethodModel?> selectedPaymentMethod(context) {
    return showModalBottomSheet<PaymentMethodModel>(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(QafSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: QafSizes.spaceBtwSections,
            children: [
              const SectionHeading(
                  text: 'Select Payment Method', isActionButton: false),
              PaymentTile(
                paymentMethodModel: PaymentMethodModel(
                    name: 'Paypal',
                    image: Assets.icons.paymentMethods.paypal.path),
              ),
              PaymentTile(
                paymentMethodModel: PaymentMethodModel(
                    name: 'Google Pay',
                    image: Assets.icons.paymentMethods.googlePay.path),
              ),
              PaymentTile(
                paymentMethodModel: PaymentMethodModel(
                    name: 'Apple Pay',
                    image: Assets.icons.paymentMethods.applePay.path),
              ),
              PaymentTile(
                paymentMethodModel: PaymentMethodModel(
                    name: 'VISA', image: Assets.icons.paymentMethods.visa.path),
              ),
              PaymentTile(
                paymentMethodModel: PaymentMethodModel(
                    name: 'Master Card',
                    image: Assets.icons.paymentMethods.masterCard.path),
              ),
            ],
          ),
        ),
      ),
    );
  }

static Future<AddressModel?> selectNewAddress(BuildContext context) async {
  return await showModalBottomSheet<AddressModel?>(
    context: context,
    builder: (_) => BlocProvider.value(
      value: getIt<AddressesCubit>()..fetchAllUserAddress(),
      child: Container(
        padding: EdgeInsetsDirectional.all(QafSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(text: 'Select Address'),
            SizedBox(height: QafSizes.spaceBtwSections),
            Expanded(
              child: BlocBuilder<AddressesCubit, AddressesState>(
                builder: (context, state) {
                  final cubit = context.read<AddressesCubit>();
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.addresses.length,
                    itemBuilder: (context, index) => SingleAddress(
                      addressModel: cubit.addresses[index],
                      onTap: () {
                        Navigator.of(context).pop(cubit.addresses[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  // static Future<AddressModel?> selectNewAddress(BuildContext context) {
  //   return showModalBottomSheet<AddressModel?>(
  //     context: context,
  //     builder: (_) => BlocProvider.value(
  //       value:  getIt<AddressesCubit>()..fetchAllUserAddress(),
  //       child: Container(
  //         padding: EdgeInsetsDirectional.all(QafSizes.lg),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           spacing: QafSizes.spaceBtwSections,
  //           children: [
  //             SectionHeading(text: 'Select Address'),
  //             BlocBuilder<AddressesCubit, AddressesState>(
  //               builder: (context, state) => ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: context.read<AddressesCubit>().addresses.length,
  //                 itemBuilder: (context, index) => SingleAddress(
  //                   addressModel:
  //                       context.read<AddressesCubit>().addresses[index],
  //                   onTap: () async {
  //                     await context.read<AddressesCubit>().selectAddress(
  //                           context.read<AddressesCubit>().addresses[index],
  //                         );
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
