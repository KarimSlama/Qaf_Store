import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

import '../../../../utils/constants/qaf_sizes.dart';

class QafMessageInputField extends StatelessWidget {
  const QafMessageInputField({
    super.key,
    required TextEditingController messageController,
    required this.onSendPressed,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final VoidCallback onSendPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: QafSizes.sm,
        right: QafSizes.sm,
      ),
      child: SizedBox(
          height: 60,
          child: TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type your message here',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: onSendPressed,
                  icon: Icon(Iconsax.send1, color: QafColors.primary)),
            ),
          )),
    );
  }
}
