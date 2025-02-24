import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/devices/qaf_device_utility.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class QafTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  const QafTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return Material(
      color: dark ? QafColors.black : QafColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: QafColors.primary,
        labelColor: dark ? QafColors.white : QafColors.primary,
        unselectedLabelColor: QafColors.darkGrey,
        dividerColor: Colors.transparent,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(QafDeviceUtility.getAppbarHeight());
}
