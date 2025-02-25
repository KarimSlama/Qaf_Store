import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class SettingMenuTile extends StatelessWidget {
  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: QafColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
