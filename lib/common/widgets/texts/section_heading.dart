import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final bool isActionButton;
  final String text, buttonText;
  final Color? textColor;
  final void Function()? onPressed;
  const SectionHeading(
      {super.key,
      this.isActionButton = true,
      required this.text,
      this.buttonText = 'View all',
      this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (isActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
