import 'package:flutter/material.dart';
import 'package:my_chat/helper/helper_functions.dart';
import 'package:my_chat/screens/home_page.dart';
import 'package:my_chat/screens/login_page.dart';
import 'package:my_chat/shared/constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSignedIn = false;
  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        isSignedIn = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: isSignedIn ? const HomePage() : const LogInPage(),
    );
  }
}
