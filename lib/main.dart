import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/login.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/splashscreen.dart';
import 'package:todo_app/user_provider.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return MaterialApp(
            title: 'Todo List',
            themeMode: ThemeMode.system,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: userProvider.isLoggedIn ? const HomeScreen() : const LoginScreen(),
            routes: {
              '/home': (context) => const HomeScreen(),
              '/login': (context) => const LoginScreen(),
              '/splash': (context) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
