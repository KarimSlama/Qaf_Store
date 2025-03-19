import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_state.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/features/screens/address/data/repository/address_repository.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final AddressRepository addressRepository;
  AddressesCubit(this.addressRepository) : super(AddressesState.initial());

  AddressModel selectedAddress = AddressModel.empty();
  List<AddressModel> addresses = [];
  AddressModel addressModel = AddressModel.empty();
  bool refreshData = true;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  Future<void> fetchAllUserAddress() async {
    try {
      emit(AddressesState.loading());
      final addresses = await addressRepository.fetchAllUserAddress();
      addresses.when(
          success: (addresses) {
            addresses.firstWhere((element) => element.selectedAddress,
                orElse: () => AddressModel.empty());
            this.addresses = addresses;
            emit(AddressesState.success(addresses));
          },
          failure: (error) => emit(AddressesState.error(error)));
    } catch (error) {
      emit(AddressesState.error(error.toString()));
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.id.isNotEmpty) {
        await addressRepository.updateSelectedUserAddress(
            selectedAddress.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress = newSelectedAddress;
      final result = await addressRepository.updateSelectedUserAddress(
          selectedAddress.id, true);
      result.when(
        success: (data) => emit(AddressesState.selected(selectedAddress.id)),
        failure: (error) => emit(AddressesState.error(error)),
      );
    } catch (error) {
      emit(AddressesState.error(error.toString()));
    }
  }

  Future addNewAddress() async {
    try {
      emit(AddressesState.addNewAddressLoading());
      if (!addressFormKey.currentState!.validate()) return;

      addressModel = AddressModel(
        id: '',
        name: nameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        street: streetController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        country: countryController.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(addressModel);
      addressModel.id = id;

      await selectAddress(addressModel);

      emit(AddressesState.addNewAddressSuccess(addressModel.id));
    } catch (error) {
      emit(AddressesState.addNewAddressError(error.toString()));
    }
  }

  void restFormField() {
    nameController.clear();
    phoneController.clear();
    stateController.clear();
    streetController.clear();
    postalCodeController.clear();
    countryController.clear();
    cityController.clear();
  }
}