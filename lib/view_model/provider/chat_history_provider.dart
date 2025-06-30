import 'package:flutter/material.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_base_helper.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_url.dart';

class ChatHistoryProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  List<dynamic> chatHistoryList = [];
  bool isLoading = false;

  Future<void> fetchChatHistory(String userId) async {
    isLoading = true;
    notifyListeners();

    final response = await apiBaseHelper.getApiCall(
      chatHistoryApiUrl(userId),
      null,
    );
    chatHistoryList = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> sendMessage(
    String chatId,
    String content,
    String senderId,
  ) async {
    try {
      final Map<String, dynamic> param = {
        "chatId": chatId,
        "senderId": senderId,
        "content": content,
        "messageType": "text",
        "fileUrl": "",
      };

      final response = await apiBaseHelper.postAPICall(
        sendMessageApiUrl(),
        param,
      );
      notifyListeners();

      print("Send Message Response: $response");
    } catch (e) {
      print("Send message failed: $e");
    }
  }
}
