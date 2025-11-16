import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomerService {
  static const String webhookUrl =
      'https://karim-slama2.app.n8n.cloud/webhook/customer-service-chat';

  Future<Map<String, dynamic>> sendMessage({
    required String message,
    required String userId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(webhookUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
          'userId': userId,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }
}
