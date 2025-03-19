import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class AddressService {
 Future<ServerResult<List<AddressModel>>> fetchUserAddress();
 Future<ServerResult<void>> updateSelectedUserAddress(String addressId, bool selected);
 Future<String> addUserAddress(AddressModel address);
}