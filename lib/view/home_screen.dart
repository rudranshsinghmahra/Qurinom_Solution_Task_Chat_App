import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/chat_provider.dart';

import 'chat_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});

  final String userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatProvider>(
        context,
        listen: false,
      ).fetchHomeScreenChat(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qurinom Chat App")),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return chatProvider.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatProvider.chatList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatHistoryScreen(
                              chatId: chatProvider.chatList[index]['_id'],
                            ),
                          ),
                        );
                      },
                      title: chatProvider.chatList[index]['lastMessage'] != null
                          ? Text(
                              chatProvider
                                  .chatList[index]['lastMessage']['content'],
                            )
                          : Text(""),
                    );
                  },
                );
        },
      ),
    );
  }
}
