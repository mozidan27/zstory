import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zstory/pages/chat_page.dart';
import 'package:zstory/services/auth/loginOrRegister_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ChatPage(
                  onTap: () {},
                )
              : const LoginOrRegisterPage();
        },
      ),
    );
  }
}
