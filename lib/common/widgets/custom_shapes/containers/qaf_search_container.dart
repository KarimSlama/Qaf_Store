import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class QafSearchContainer extends StatelessWidget {
  final String text;
  const QafSearchContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: QafSizes.defaultSpace),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.search_normal),
          labelText: text,
        ),
      ),
    );
  }
}