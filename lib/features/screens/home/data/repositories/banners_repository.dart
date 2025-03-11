import 'package:qaf_store/features/screens/home/data/models/banners_model.dart';
import 'package:qaf_store/network/services/banners/banners_service.dart';
import 'package:qaf_store/network/services/server_result.dart';

class BannersRepository {
  final BannersService bannersService;

  BannersRepository(this.bannersService);

  Future<ServerResult<List<BannersModel>>> fetchAllBanners() async {
    try {
      final banners = await bannersService.fetchBanners();
      return banners.when(
        success: (bannersList) {
      
          return ServerResult.success(bannersList);
        },
        failure: (error) {
          return ServerResult.failure(error.toString());
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> uploadBanners(List<BannersModel> banners) async {
    try {
      final response = await bannersService.uploadBanners(banners);
      return response.when(
        success: (banner) {
          return ServerResult.success(banner);
        },
        failure: (error) {
          return ServerResult.failure(error);
        },
      );
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
