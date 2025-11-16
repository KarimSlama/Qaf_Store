import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/customer_service/widgets/dots_loading_animation.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

import '../../../utils/constants/qaf_colors.dart';
import 'cubit/customer_service_cubit.dart';
import 'cubit/customer_service_state.dart';
import 'widgets/build_welcome_screen.dart';
import 'widgets/chat_message_bubble.dart';
import 'widgets/message_input_text_field.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() =>
      _CustomerServiceChatScreenState();
}

class _CustomerServiceChatScreenState extends State<CustomerServiceScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      context.read<CustomerServiceCubit>().sendMessage(message);
      _messageController.clear();
      Future.delayed(Duration(milliseconds: 100), _scrollToBottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Iconsax.arrow_left_24,
              color: QafHelperFunctions.isDark(context)
                  ? QafColors.white
                  : QafColors.black,
            )),
        title: Row(
          spacing: 10.w,
          children: [
            CircleAvatar(
              backgroundColor: theme.primaryColor,
              child: Icon(Iconsax.headphone, color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Customer Service'),
                Text(
                  'Online',
                  style: theme.textTheme.bodySmall?.apply(
                    color: QafColors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          children: [
            // Messages List
            Expanded(
              child: BlocConsumer<CustomerServiceCubit, CustomerServiceState>(
                listener: (context, state) {
                  if (state is ChatLoaded || state is ChatLoading) {
                    Future.delayed(
                        Duration(milliseconds: 100), _scrollToBottom);
                  }
                },
                builder: (context, state) {
                  if (state is ChatInitial) return buildWelcomeScreen();

                  if (state is ChatLoaded || state is ChatLoading) {
                    final messages = state is ChatLoaded
                        ? state.messages
                        : (state as ChatLoading).messages;

                    return ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return ChatMessageBubble(message: message);
                      },
                    );
                  }

                  if (state is ChatError) {
                    return Center(child: Text(state.message));
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),

            BlocBuilder<CustomerServiceCubit, CustomerServiceState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Iconsax.headphone, color: Colors.white),
                      ),
                      DotsLoadingAnimation(),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),

            QafMessageInputField(
              messageController: _messageController,
              onSendPressed: () {
                if (_messageController.text.isNotEmpty) {
                  _sendMessage();
                  _messageController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
