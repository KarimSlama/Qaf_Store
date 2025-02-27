import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.myOrders,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
    );
  }
}
