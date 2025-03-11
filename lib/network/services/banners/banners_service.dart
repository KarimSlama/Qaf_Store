import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/network/services/server_result.dart';

abstract class BannersService {
  Future<ServerResult<void>> uploadBanners(List<BannersModel> banners);
  Future<ServerResult<List<BannersModel>>> fetchBanners();
}
