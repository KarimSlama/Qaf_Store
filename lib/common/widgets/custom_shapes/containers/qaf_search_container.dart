import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';

class QafSearchContainer extends StatelessWidget {
  final String text;
  final EdgeInsetsDirectional padding;
  const QafSearchContainer(
      {super.key,
      required this.text,
      this.padding = const EdgeInsetsDirectional.symmetric(
          horizontal: QafSizes.defaultSpace)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.search_normal),
          labelText: text,
        ),
      ),
    );
  }
}
