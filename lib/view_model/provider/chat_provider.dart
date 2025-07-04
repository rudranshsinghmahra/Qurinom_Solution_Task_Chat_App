import 'package:flutter/material.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_base_helper.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_url.dart';

class ChatProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  List<dynamic> chatList = [];
  bool isLoading = false;

  Future<void> fetchHomeScreenChat(String userId) async {
    isLoading = true;
    notifyListeners();

    final response = await apiBaseHelper.getApiCall(
      homePageChatApiUrl(userId),
      null,
    );
    chatList = response;
    isLoading = false;
    print(chatList);
    notifyListeners();
  }
}
