import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/network/services/banners/banners_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class BannersServiceImpl implements BannersService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<ServerResult<List<BannersModel>>> fetchBanners() async {
    try {
      final banners = await _firestore
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      final result = banners.docs
          .map((banner) => BannersModel.fromSnapshot(banner))
          .toList();
      print('the result with banners impl is ${result.first}');
      return ServerResult.success(result);
    } catch (error) {
      print('error with banners service impl catched is $error');
      return ServerResult.failure(error.toString());
    }
  }
}
