import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/features/screens/address/widgets/single_address.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressesCubit = context.read<AddressesCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.addNewAddressScreen),
        backgroundColor: QafColors.primary,
        child: Icon(Iconsax.add, color: QafColors.white),
      ),
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text(QafStrings.addresses,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: BlocBuilder<AddressesCubit, AddressesState>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              if (addressesCubit.addresses.isNotEmpty &&
                  addressesCubit.selectedAddress.id.isEmpty) {
                final selectedAddress = addressesCubit.addresses.firstWhere(
                  (address) => address.selectedAddress,
                  orElse: () => AddressModel.empty(),
                );

                if (selectedAddress.id.isNotEmpty) {
                  addressesCubit.selectAddress(selectedAddress);
                }
              }
              return state.maybeWhen(
                loading: () =>
                    QafShimmerEffect(width: double.infinity, height: 80),
                success: (address) {
                  return ListView.builder(
                      itemCount: address.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => SingleAddress(
                          addressModel: address[index],
                          onTap: () => context
                              .read<AddressesCubit>()
                              .selectAddress(address[index])));
                },
                error: (error) => Text('no data found $error'),
                orElse: () => SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
