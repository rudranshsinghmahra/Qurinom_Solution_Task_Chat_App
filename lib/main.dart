import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurinom_solutions_task_chat_app/view/login_screen.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/chat_history_provider.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/chat_provider.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/checkBox_provider.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckboxProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => ChatHistoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false);
  }
}
