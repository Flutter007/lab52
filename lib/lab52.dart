import 'package:flutter/material.dart';
import 'package:lab52/app_routes.dart';
import 'package:lab52/provider/person_list_provider.dart';
import 'package:lab52/provider/user_provider.dart';
import 'package:lab52/screens/chat_history_screen.dart';
import 'package:lab52/screens/home_navigation_screen.dart';
import 'package:lab52/screens/registration_screen.dart';
import 'package:provider/provider.dart';

class Lab52 extends StatefulWidget {
  const Lab52({super.key});

  @override
  State<Lab52> createState() => _Lab52State();
}

class _Lab52State extends State<Lab52> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PersonListProvider()),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.registration,
        routes: {
          AppRoutes.registration: (ctx) => RegistrationScreen(),
          AppRoutes.home: (ctx) => HomeNavigatorScreen(),
          AppRoutes.chat: (ctx) => ChatHistoryScreen(),
        },
      ),
    );
  }
}
