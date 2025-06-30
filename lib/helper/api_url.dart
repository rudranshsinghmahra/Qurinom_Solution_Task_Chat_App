const String baseUrl = "http://45.129.87.38:6065";

Uri userLoginApiUrl() {
  final url = Uri.parse("$baseUrl/user/login");
  return url;
}

Uri homePageChatApiUrl(String userId) {
  final url = Uri.parse("http://45.129.87.38:6065/chats/user-chats/$userId");
  return url;
}

Uri chatHistoryApiUrl(String chatId) {
  final url = Uri.parse(
    "http://45.129.87.38:6065/messages/get-messagesformobile/$chatId",
  );
  return url;
}

Uri sendMessageApiUrl() {
  final url = Uri.parse("http://45.129.87.38:6065/messages/sendMessage");
  return url;
}
