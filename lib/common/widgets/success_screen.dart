import 'package:flutter/material.dart';
import 'package:qaf_store/common/styles/qaf_spacing_style.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subTitle;
  final VoidCallback onPressed;
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: QafSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            spacing: QafSizes.spaceBtwItems,
            children: [
              Image.asset(
                  width: QafHelperFunctions.screenWidth(context) * .6, image),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: Text(QafStrings.continue_)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
