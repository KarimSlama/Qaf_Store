import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class SingleAddress extends StatelessWidget {
  final AddressModel addressModel;
  final VoidCallback onTap;
  const SingleAddress(
      {super.key, required this.addressModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);

    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        final selectedAddressId =
            context.read<AddressesCubit>().selectedAddress.id;
        final isSelectedAddress = selectedAddressId == addressModel.id;

        return GestureDetector(
          onTap: onTap,
          child: RoundedContainer(
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
                      addressModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(addressModel.phoneNumber,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(
                        '${addressModel.street}, ${addressModel.city}, ${addressModel.city}',
                        maxLines: 1,
                        softWrap: true)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}