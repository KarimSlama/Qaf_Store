import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/chat_message_model.dart';
import '../data/repository/customer_service_repository.dart';
import 'customer_service_state.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState> {
  final CustomerServiceRepository _customerServiceRepository;
  final List<ChatMessage> _messages = [];

  CustomerServiceCubit(this._customerServiceRepository) : super(ChatInitial());

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: message,
      isUser: true,
      timestamp: DateTime.now(),
    );

    _messages.add(userMessage);
    emit(ChatLoaded(List.from(_messages)));

    emit(ChatLoading(List.from(_messages)));

    final response = await _customerServiceRepository.sendMessage(
      message: message,
    );

    response.when(
      success: (aiResponse) {
        final aiMessage = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          message: aiResponse,
          isUser: false,
          timestamp: DateTime.now(),
        );

        _messages.add(aiMessage);
        emit(ChatLoaded(List.from(_messages)));
      },
      failure: (error) {
        emit(ChatError(error));

        Future.delayed(const Duration(seconds: 2), () {
          emit(ChatLoaded(List.from(_messages)));
        });
      },
    );

  }

  void clearChat() {
    _messages.clear();
    emit(ChatInitial());
  }
}