import 'package:flutter/material.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/screens/profile/widgets/profile_bloc_builder.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.profile,
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: const ProfileBlocBuilder(), 
    );
  }
}