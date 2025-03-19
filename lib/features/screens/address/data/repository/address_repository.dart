import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/network/services/addresses/address_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class AddressRepository {
  final AddressService addressService;

  const AddressRepository(this.addressService);

  Future<ServerResult<List<AddressModel>>> fetchAllUserAddress() async {
    try {
      final addresses = await addressService.fetchUserAddress();
      return addresses.when(
          success: (addresses) => ServerResult.success(addresses),
          failure: (error) => ServerResult.failure(error));
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> updateSelectedUserAddress(
      String addressId, bool selected) async {
    try {
      final address =
          await addressService.updateSelectedUserAddress(addressId, selected);
      return ServerResult.success(address);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final newAddress = await addressService.addUserAddress(address);
      return newAddress;
    } catch (error) {
      throw 'the error with fetch user address in AddressServiceImpl $error';
    }
  }
}
