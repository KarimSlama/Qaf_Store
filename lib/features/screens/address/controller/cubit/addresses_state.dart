import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';

part 'addresses_state.freezed.dart';

@freezed
class AddressesState with _$AddressesState {
  const factory AddressesState.initial() = _Initial;
  const factory AddressesState.loading() = Loading;
  const factory AddressesState.success(List<AddressModel> address) = Success;
  const factory AddressesState.selected(String addressId) = Selected;
  const factory AddressesState.error(String error) = Error;
  const factory AddressesState.addNewAddressLoading() = AddNewAddressLoading;
  const factory AddressesState.addNewAddressSuccess(String addressId) = AddNewAddressSuccess;
  const factory AddressesState.addNewAddressError(String error) = AddNewAddressError;
}
