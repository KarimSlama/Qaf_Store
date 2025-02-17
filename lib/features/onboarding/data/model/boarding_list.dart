import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class BoardingModel {
  final String image;
  final String title;
  final String subTitle;

  BoardingModel(
      {required this.image, required this.title, required this.subTitle});
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: Assets.images.sammyLineSearching.path,
    title: QafStrings.onBoardingTitle1,
    subTitle: QafStrings.onBoardingSubTitle1,
  ),
  BoardingModel(
    image: Assets.images.sammyLineShopping.path,
    title: QafStrings.onBoardingTitle2,
    subTitle: QafStrings.onBoardingSubTitle2,
  ),
  BoardingModel(
    image: Assets.images.sammyLineDelivery.path,
    title: QafStrings.onBoardingTitle3,
    subTitle: QafStrings.onBoardingSubTitle3,
  ),
];
