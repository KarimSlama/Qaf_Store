import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/features/screens/checkout/widgets/selection_btm_sheet.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressesCubit = context.read<AddressesCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: QafSizes.sm,
      children: [
        SectionHeading(
          text: QafStrings.shippingAddress,
          buttonText: QafStrings.change,
          isActionButton: true,
          onPressed: () async {
            final selectedAddress =
                await SelectionBottomSheet.selectNewAddress(context);
            if (selectedAddress != null) {
              addressesCubit.selectAddress(selectedAddress);
            }
          },
        ),
        BlocBuilder<AddressesCubit, AddressesState>(
          builder: (context, state) {
            if (addressesCubit.selectedAddress.id.isEmpty) {
              return Text(
                QafStrings.selectAddress,
                style: Theme.of(context).textTheme.bodyMedium,
              );
            }

            return Column(
              spacing: QafSizes.defaultSpace / 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressesCubit.selectedAddress.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  spacing: QafSizes.sm,
                  children: [
                    const Icon(
                      Iconsax.call,
                      color: QafColors.grey,
                      size: 16,
                    ),
                    Text(
                      addressesCubit.selectedAddress.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  spacing: QafSizes.sm,
                  children: [
                    const Icon(
                      Iconsax.location,
                      color: QafColors.grey,
                      size: 16,
                    ),
                    Text(
                      '${addressesCubit.selectedAddress.street}, ${addressesCubit.selectedAddress.state}, ${addressesCubit.selectedAddress.city}, ${addressesCubit.selectedAddress.country}, \n${addressesCubit.selectedAddress.postalCode}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}