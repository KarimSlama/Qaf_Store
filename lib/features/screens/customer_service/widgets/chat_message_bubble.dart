import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/qaf_colors.dart';
import '../../../../utils/helper/qaf_helper_functions.dart';
import '../data/model/chat_message_model.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: message.isUser ? theme.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.h,
          children: [
            Text(
              message.message,
              style: theme.textTheme.bodyMedium?.apply(
                color: message.isUser ? QafColors.white : QafColors.black,
              ),
            ),
            Text(
              QafHelperFunctions.formatTime(message.timestamp),
              style: theme.textTheme.bodyMedium?.apply(
                color: message.isUser
                    ? QafColors.white.withValues(alpha: .7)
                    : QafColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
