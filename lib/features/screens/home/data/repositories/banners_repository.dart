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
          print('banners list in banners repository is ${bannersList[0].targetScreen}');
          return ServerResult.success(bannersList);
        },
        failure: (error) {
          print('error with banners repository failure is $error');
          return ServerResult.failure(error.toString());
        },
      );
    } catch (error) {
      print('error with banners repository catched is $error');
      return ServerResult.failure(error.toString());
    }
  }
}
