import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class SettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsMenuTile(
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
      subtitle:
          Text(subTitle ?? '', style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
