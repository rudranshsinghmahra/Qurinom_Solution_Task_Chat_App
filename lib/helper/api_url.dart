const String baseUrl = "http://45.129.87.38:6065";

Uri userLoginApiUrl() {
  final url = Uri.parse("$baseUrl/user/login");
  return url;
}

Uri homePageChatApiUrl() {
  final url = Uri.parse(
    "http://45.129.87.38:6065/messages/get-messagesformobile/679bbd688c09df5b75cd1070",
  );
  return url;
}
