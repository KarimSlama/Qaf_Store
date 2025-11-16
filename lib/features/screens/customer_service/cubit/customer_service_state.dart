
import '../data/model/chat_message_model.dart';

sealed class CustomerServiceState {
  CustomerServiceState();
}

class ChatInitial extends CustomerServiceState {
  ChatInitial();
}

class ChatLoading extends CustomerServiceState {
  final List<ChatMessage> messages;
  ChatLoading(this.messages);
}

class ChatLoaded extends CustomerServiceState {
  final List<ChatMessage> messages;
  ChatLoaded(this.messages);
}

class ChatError extends CustomerServiceState {
  final String message;
  ChatError(this.message);
}
