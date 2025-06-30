import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/chat_history_provider.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key, required this.chatId});

  final String chatId;

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatHistoryProvider>(
        context,
        listen: false,
      ).fetchChatHistory(widget.chatId);
    });
  }

  void _sendMessage() {
    final message = messageController.text.trim();
    if (message.isNotEmpty) {
      Provider.of<ChatHistoryProvider>(context, listen: false)
          .sendMessage(widget.chatId, message, "673d80bc2330e08c323f4393")
          .then((_) {
            messageController.clear();
            Provider.of<ChatHistoryProvider>(
              context,
              listen: false,
            ).fetchChatHistory(widget.chatId);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat History")),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatHistoryProvider>(
              builder: (context, chatHistoryProvider, child) {
                return chatHistoryProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        reverse: true,
                        itemCount: chatHistoryProvider.chatHistoryList.length,
                        itemBuilder: (context, index) {
                          final chat =
                              chatHistoryProvider.chatHistoryList[index];
                          return ListTile(title: Text("${chat['content']}"));
                        },
                      );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(onPressed: _sendMessage, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
