import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class UploadMenuTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const UploadMenuTitle(
      {super.key,
      required this.icon,
      required this.title,
      this.subTitle,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: QafColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: subTitle,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
