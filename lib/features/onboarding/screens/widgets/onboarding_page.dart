import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  final String image, title, subTitle;
  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16.h,
        children: [
          Image(
              width: QafHelperFunctions.screenWidth(context) * .8,
              height: QafHelperFunctions.screenHeight(context) * .6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
