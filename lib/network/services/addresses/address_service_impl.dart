import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qaf_store/features/screens/address/data/model/address_model.dart';
import 'package:qaf_store/network/services/addresses/address_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class AddressServiceImpl implements AddressService {
  final firestore = FirebaseFirestore.instance;

  final _userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<ServerResult<List<AddressModel>>> fetchUserAddress() async {
    try {
      if (_userId.isEmpty) return ServerResult.failure('User Id is Empty');
      final address = await firestore
          .collection('users')
          .doc(_userId)
          .collection('Addresses')
          .get();
      final result = address.docs
          .map(
              (documentSnapshot) => AddressModel.fromSnapshot(documentSnapshot))
          .toList();

      return ServerResult.success(result);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<void>> updateSelectedUserAddress(
      String addressId, bool selected) async {
    try {
      final result = await firestore
          .collection('users')
          .doc(_userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
      return ServerResult.success(result);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<String> addUserAddress(AddressModel address) async {
    try {
      final currentAddress = await firestore
          .collection('users')
          .doc(_userId)
          .collection('Addresses')
          .add(address.toJson());
          return currentAddress.id;
    } catch (error) {
      throw 'the error with fetch user address in AddressServiceImpl $error';
    }
  }
}
