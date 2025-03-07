import 'package:flutter/material.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class CloseAccountAlertDialog extends StatelessWidget {
  final VoidCallback onPressed;
  const CloseAccountAlertDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Account ?"),
      content: Text(
          "Are you sure you want to delete your account permanently? This action is not revisible and all of your data will be removed permanently"),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: QafColors.error,
            side: BorderSide(color: Colors.red),
          ),
          onPressed: onPressed,
          child: Padding(
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: QafSizes.lg),
            child: Text('Delete'),
          ),
        ),
      ],
    );
  }
}
