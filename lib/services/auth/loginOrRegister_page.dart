import 'package:flutter/material.dart';
import 'package:zstory/pages/login_page.dart';
import 'package:zstory/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // Initially show login page
  bool showLoginPage = true;

  // Toggle between login & register page
  void togglePages() {
    print('Toggle Login/Register called');
    setState(() {
      showLoginPage = !showLoginPage;
      print('showLoginPage: $showLoginPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building LoginOrRegisterPage: showLoginPage = $showLoginPage');
    return showLoginPage
        ? LoginPage(onTap: togglePages)
        : RegisterPage(onTap: togglePages);
  }
}
