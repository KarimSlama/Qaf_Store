import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final bool isNetworkImage, applyImageRadius;
  final BoxFit? fit;
  final BoxBorder? border;
  final double borderRadius;
  final EdgeInsetsDirectional? padding;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const RoundedImage(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.isNetworkImage = false,
      this.applyImageRadius = true,
      this.fit = BoxFit.contain,
      this.border,
      this.borderRadius = 12,
      this.padding,
      this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
                image: isNetworkImage
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider)),
      ),
    );
  }
}
